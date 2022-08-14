extends Node2D


var version = "0.1.0"
signal player_died()


const Dialogue = preload("res://game_response/dialogue.gd")

var conversation = {
	"apple_man" : [0, false],
	"shady_guy" : [0, false],
	"bouncer" : [0, false],
	"ice_cream_man" : [0, false],
	"tutorial_guy" : [0, false],
	"shop_keep_2a4" : [0, false],
	"test_dummy" : [0, false]
}
var all_dialogue = {}

#variables to save when game is saved
var save_dict = {
	"places_found" : [],
	"conversation" : {},
	"location" : "",
	"player_hp" : 0,
	"player_mp" : 0,
	"player_money" : 0,
	"player_inventory" : [],
	"save_version" : "0.0.0"
}
var save_vars = ["places_found", "conversation", "location", "player_hp", "player_mp","player_money", "player_inventory", "save_version"]

#create a player
const my_player = preload("res://player/player.tscn")
var player = my_player.instance()

var movement_handler = load("res://map/movement_handler.tscn")
var movement = movement_handler.instance()

#the various help pages
var help_formatted_1 = [
	"\n> look ; This command can be used to inspect an area. Who knows what you'll find?\n",
	"\n> go [location] ; This command is used by typing go and the direction you wish to go, such as 'go down' or 'go north'. Additionally, it may be used without go, instead just by typing 'left' or 'south', for those who are inclined to be lazy\n",
	"\n> climb [direction] ; This command can be used either as 'climb up' or 'climb down', as well as 'ascend' and 'descend'\n",
	"\n> help [topic] ; Type help with a command type for specific help pages, such as 'help items' or 'help save'\n"
	]
var help_formatted_2 = [
	"\n> inventory ; Typing this command reveals the items you have, if any\n",
	"\n> take [item] ; This command needs a specific item, otherwise, how will I know what you pick up? The formatting can be typed 'take sword'\n",
	]
var help_formatted_3 = [
	"\n talk to [name] ; If there is a person in the area, type this command to speak to them, formatted as 'talk to man' or 'talk to the bouncer'. CAUTION: Once you're in a conversation you have to finish the conversation to continue the game.\n",
	"\n [conversation commands] ; When in a conversation, the commands will show up below the character's words, and can be entered simply by typing them, like 'yes' or 'no'\n"
	]
var help_formatted_4 = [
	"\n> save [file_name] ; As before, one may type this command in a format such as 'save 1' or 'save my_game'\n",
	"\n> load [file_name]; Exactly the same as previous, but replace save with load\n",
	]

#array for words to be saved to
var words = []

#all arrays to check through for commands
var go_to = ["go", "travel", "move"]
var climbing = ["ascend", "descend", "climb"]
var inspect_place = ["look", "inspect"]

var inv = ["inventory", "items"]
var take_item = ["take", "grab", "pickup"]
var use_item = ["use"]

var help_me = ["help"]

var save = ["save"]
var _load = ["load", "remember"]
var exit = ["quit"]

var arrays = [go_to, help_me, save, _load, inspect_place, inv, take_item, climbing, exit]

#various other variables
var curse_count = 0
				#area name, area variables, max stamina, money, inventory
var last_safe_space = ["d5", movement.map_vars.duplicate(), 15, 0, []]

#add the player to the game
func _ready() -> void:
	add_child(player)
	$staminaRegenTimer.start()
	player.update_bars()
	all_dialogue = Dialogue.load_text()


#check text and return response
func process_command(input: String) -> String:
	#make the text lowercase
	input = input.to_lower()
	words = []
	
	#get all words in the text
	var temp_words = []
	temp_words = input.split(" ", false)
	
	#if the words are unnecessary, remove them
	for word in temp_words:
		if not word in ["the", "to"]:
			words.append(word)
	
	#check if there are no valid words
	if words.size() == 0:
		return "I beg your pardon?"
	
	#set up word variables
	var first_word = words[0]
	var second_word = ""
	var third_word = ""
	
	if words.size() > 1:
		second_word = words[1]
	if words.size() > 2:
		third_word = words[2]
	
	#check if the first word matches, then run associated functions
	match first_word:
		"go", "travel", "move", "up", "north", "down", "south", "left", "west", "right", "east":
			return go(first_word, second_word)
		"ascend", "descend", "climb":
			return change_height(first_word, second_word, third_word)
		"look", "inspect":
			return movement.inspect()
		"inventory", "inv", "items":
			return player.format_inv()
		"take", "grab", "pickup":
			return player.new_item(movement.item_check(second_word))
		"use":
			return player.use_item(player.inventory_check(second_word), movement.key_check(player.inventory_check(second_word)))
		"help":
			return help(second_word)
		"save":
			return save_game(second_word)
		"load", "remember":
			return load_game(second_word)
		"quit":
			return quit_game(second_word)
		"fuck", "shit", "crap", "bitch":
			curse_count += 1
			
			if curse_count % 2 == 0:
				conversation_vars([["money", -100]], "")
				return "A penalty!"
			else:
				return "Such language in this fine establishment!"
		_:
			return check_for_valid_words(words)


#moving around the map
func go(first_word: String, second_word: String) -> String:
	#if theres no direction, ask for one
	if second_word == "" and first_word in go_to:
		return "Go where?"
	else:
		#check through all directions
		for array in movement.PLACES:
			#if the first word is a direction, move with that
			if first_word in array:
				return do_the_move(first_word)
			#if the second word is a direction, move with that
			elif second_word in array:
				return do_the_move(second_word)
		
		return do_the_move(second_word)


#takes all movement logic and squooshes it together
func do_the_move(word_to_move: String) -> String:
	var movement_stuff = movement.move(word_to_move)
	
	if player.magic - 1 <= 0 and movement_stuff.size() > 1 and not movement_stuff[2]:
		var reset = reset_player(last_safe_space)
		if reset != null:
			return reset
		else:
			return "You passed out!"
	
	if movement_stuff.size() > 1:
		var stamina_usage = player.use_magic(movement_stuff[1])
		
		if movement_stuff[2]:
			set_safe_space(movement.current_area, movement.map_vars, player.max_magic, player.money, player.inventory)
		
		return movement_stuff[0] + "\n" + stamina_usage[0]
	
	return movement_stuff[0]


#climbing up and down
func change_height(first_word: String, second_word: String, third_word: String) -> String:
	#if climb is the starting word
	if first_word == "climb":
		#if third word is an item
		if third_word in player.Items.items_array and player.Items.valid_items[third_word].has("climable"):
			#if no valid direction entered
			if not second_word in ["ascend", "descend", "up", "down"]:
				return "Climb where?"
			else:
				return movement.change_height(third_word, player.Items.valid_items[third_word]["climable"], second_word)
		#if second word is an item
		elif second_word in player.Items.items_array and player.Items.valid_items[second_word].has("climable"):
			#if no valid direction entered
			if not third_word in ["ascend", "descend", "up", "down"]:
				return "Climb where?"
			else:
				return movement.change_height(second_word, player.Items.valid_items[second_word]["climable"], third_word)
		#if there isn't an item
		else:
			return movement.change_height(second_word, false)
	#other words used, like ascend and descend
	else:
		#if item
		if second_word in player.Items.items_array and player.Items.valid_items[second_word].has("climable"):
			return movement.change_height(second_word, player.Items.valid_items[second_word]["climable"], first_word)
		elif third_word in player.Items.items_array and player.Items.valid_items[third_word].has("climable"):
			return movement.change_height(third_word, player.Items.valid_items[third_word]["climable"], second_word)
		#if not item
		else:
			return movement.change_height(first_word, false)


#set the safe space variable
func set_safe_space(area: String, areas: Dictionary, magic: int, money: int, items: Array) -> void:
	last_safe_space = [area, areas, magic, money, items]


#reset to last safe point
func reset_player(vars_to_set: Array):
	movement.current_area = vars_to_set[0]
	if vars_to_set[1].size() > 0:
		movement.map_vars = vars_to_set[1].duplicate()
	player.max_magic = vars_to_set[2]
	player.magic_bar.max_value = vars_to_set[2]
	player.magic = vars_to_set[2]
	player.inventory = vars_to_set[4]
	if player.money > 25:
		player.gain_money(-player.money/2)
		return "You passed out!\nAfter passing out, you woke up in %s, with your pockets feeling lighter." % movement.map_vars[last_safe_space[0]]["area_name"]
	else:
		emit_signal("player_died")


#turn array into a string
func array_to_string(array: Array) -> String:
	var temp_string = ""
	
	for temp_words in array:
		temp_string += temp_words + " "
	
	return temp_string


#check to see if the response starts a conversation
func check_conversation(word: Array, in_conversation: bool):
	#if the words fit and theres a person, return true
	#if the words fit but there is no person, return variables for
	#response, convo to false, and convo attempted is true
	#otherwise, no conversation
	if not in_conversation:
		if word.size() > 0 and word[0] in ["talk", "speak"] and movement.map_vars[movement.current_area].has("person"):
			var people_in_area = []
	
			#append all people in the current area in an array to check if the
			#entered person is in the current area
			for people in movement.map_vars[movement.current_area]["person"]:
				people_in_area.append(people[0])
			
			#if the person entered if valid, return true for conversations
			#as well as the official character name
			if word.size() > 1:
				for people in people_in_area:
					if word[1] in people:
						return [true, people[0]]
			else:
				return [word, "Talk to who?", false, true]
			
			#if the person isn't valid, tell the player they don't exist
			return [word, "That person doesn't exist!", false, true]
		elif word.size() > 0 and word[0] in ["talk", "speak"] and not movement.map_vars[movement.current_area].has("person"):
			return [word, "There's no one to talk to!", false, true]
		else:
			return [false]
	else:
		return [true]


#check and update variables if in conversation
func conversation_vars(var_to_change: Array, person: String):
	if var_to_change.size() == 0:
		return
	
	for vars in var_to_change:
		match vars[0]:
			"map":
				movement.map_vars[vars[1]][vars[2]][1] = vars[5]
				movement.map_vars[vars[3]][vars[4]][1] = vars[5]
			"magic":
				player.use_magic(vars[1])
			"inv":
				return player.new_item([true, vars[1]])
			"money":
				player.gain_money(vars[1])
			"conversation_finished":
				if conversation.has(person):
					conversation[person][0] = vars[1]
					conversation[person][1] = false
			"move":
				movement.current_area = vars[1]
				movement.map_vars[movement.current_area]["DISCOVERED"] = true
				return "You were moved to %s." % movement.current_area
			"person":
				conversation[vars[1]][1] = vars[2]
			"option_enable":
				all_dialogue["dialogue"][vars[1]][vars[2]]["options"][vars[3]]["enabled"] = vars[4]
			_:
				pass


#check if words are in commands, but used improperly
func check_for_valid_words(word_array: Array) -> String:
	#check through all valid words
	for word in word_array:
		for array in arrays:
			if word in array:
				#if a word is valid, let the player know
				return "I don't know %s in that context." % word
	
	#if the word isn't valid at all
	return "I don't recognize that, try again!"


#print help pages
func help(page: String) -> String:
	#setup help
	var help_string = "You can use these commands:\n"
	
	#if the page selected is in the array, add that page to print
	if page in ["", "1", "commands", "one", "basic", "move", "climb"]:
		for i in help_formatted_1:
			help_string += i
		help_string += "\nTo see more, type 'help 2'"
	elif page in ["2", "two", "items", "item", "inv", "inventory"]:
		for i in help_formatted_2:
			help_string += i
		help_string += "\nTo see more, type 'help 3'"
	elif page in ["3", "three", "talk", "conversation"]:
		for i in help_formatted_3:
			help_string += i
	elif page in ["4", "four", "save", "load"]:
		for i in help_formatted_4:
			help_string += i
	#if page isn't valid, tell the player
	else:
		return "That help page doesn't exist!"
	
	#return the help menu
	return help_string


#save game
func save_game(file_name: String) -> String:
	#create save folder
	var dir = Directory.new()
	if not dir.dir_exists("res://save_stuff/"):
		dir.make_dir_recursive("res://save_stuff/")
	
	#create new save object
	var new_save = File.new()
	var _err = new_save.open_encrypted_with_pass("res://save_stuff/save%s.tres" % file_name, File.WRITE, OS.get_unique_id())
	
	#set variables to save
	save_dict["location"] = movement.current_area
	save_dict["player_hp"] = player.health
	save_dict["player_mp"] = player.magic
	save_dict["player_money"] = player.money
	
	save_dict["conversation"] = conversation.duplicate()
	
	save_dict["save_version"] = version
	
	var discovered_places = []
	for places in movement.map_vars:
		discovered_places.append([places, movement.map_vars[places]["DISCOVERED"]])
	
	save_dict["places_found"] = discovered_places.duplicate()
	save_dict["player_inventory"] = player.inventory.duplicate()
	
	new_save.store_var(save_dict)
	new_save.close()
	
	#return success
	return "Game saved!"


#verify save
func verify_save(world_save) -> bool:
	#checks through all variables to see if the save has them
	for v in save_vars:
		print(world_save.has(v))
		if not world_save.has(v):
			return false
	
	return true


#load game
func load_game(file_name: String) -> String:
	var wrong_version = ""
	
	#get the directory
	var dir = Directory.new()
	
	#if it doesn't exist, there's no file to load
	if not dir.file_exists("res://save_stuff/save%s.tres" % file_name):
		return "Can't load, no save game exists!"
	
	#load save
	var load_save = File.new()
	var _err = load_save.open_encrypted_with_pass("res://save_stuff/save%s.tres" % file_name, File.READ, OS.get_unique_id())
	var world_save = load_save.get_var(true)
	load_save.close()
	
	if _err == 16:
		return "You took someone else's file? That's not allowed!"
	elif _err != 0:
		return "Error loading file!"
	
	#check if the file has all required variables
	if not verify_save(world_save):
		return "Can't load, this file isn't right!"
	
	if world_save.save_version != version:
		wrong_version = "This save file is the wrong version! Using this save may cause problems, so be careful!\n"
	
	#set all variables
	movement.current_area = world_save.location
	
	player.health = world_save.player_hp
	player.magic = world_save.player_mp
	player.update_bars()
	
	player.money = world_save.player_money
	player.money_visual.text = "Money: " + str(player.money)
	
	conversation = world_save["conversation"].duplicate()
	
	player.inventory = []
	for i in world_save.player_inventory:
		player.inventory.append(i)
	
	for places in world_save.places_found:
		if movement.map_vars.has(places[0]):
			movement.map_vars[places[0]]["DISCOVERED"] = places[1]
	
	#return success
	return wrong_version + "Game loaded!"


#exit the game
func quit_game(second_word: String) -> String:
	if second_word == "game":
		return "Quitting game!"
	else:
		return "Quit what?"


func _on_staminaRegenTimer_timeout() -> void:
	if movement.map_vars[movement.current_area]["safe_space"]:
		player.use_magic(1)
