extends Control


const InputResponse = preload("res://input/InputResponse.tscn")
const Response = preload("res://game_response/Response.tscn")

export (int) var max_lines_remembered := 50

var max_scroll_length := 0
var conversation = false
var convo_attempted : bool
var text_index = 0
var conversation_index = ""
var game_quit = false
var dead = false

onready var map = $Background/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/map_visual
onready var command_processor = $Background/MarginContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/CommandProcessor
onready var history_rows = $Background/MarginContainer/HBoxContainer/Rows/GameInfo/Scroll/HistoryRows
onready var scroll = $Background/MarginContainer/HBoxContainer/Rows/GameInfo/Scroll
onready var scrollbar = scroll.get_v_scrollbar()


#update the map, create the start message, and set the scrollbar
func _ready() -> void:
	map.update_visual(command_processor.movement.current_area, command_processor.movement.map_vars)
	
	var starting_message = Response.instance()
	add_response_to_game(starting_message)
	starting_message.say("You blearily open your eyes, finding yourself in a dark alleyway. It's raining and you see neon lights in the distance. What will you do?\n(Type help for help)")
	
	scrollbar.connect("changed", self, "handle_scrollbar_changed")
	max_scroll_length = scrollbar.max_value


#scroll whenever a new message shows up
func handle_scrollbar_changed() -> void:
	if max_scroll_length != scrollbar.max_value:
		max_scroll_length = scrollbar.max_value
		scroll.scroll_vertical = max_scroll_length


#when text is entered
func _on_Input_text_entered(new_text: String) -> void:
	convo_attempted = false
	
	#if nothing is there or the game is quitting, dont return it
	if new_text.empty():
		return
	elif dead:
		add_new_convo_response("", "You're dead, you can't do anything now!")
		return
	elif game_quit:
		if new_text == "cancel":
			add_new_convo_response(new_text, "Cancelled, no longer exiting!")
			game_quit = false
			$exitTimer.stop()
			return
		else:
			return
	
	var temp_words_in_command = new_text.to_lower().split(" ", false)
	
	#remove unnecessary words from the players entered command
	var words_in_command = []
	for i in temp_words_in_command:
		if not i in ["the", "to", "do"]:
			words_in_command.append(i)
	
	#set conversation index if there is a current conversation OR if a
	#conversation is starting
	var temp_convo = command_processor.check_conversation(words_in_command, conversation)
	if temp_convo.size() == 2:
		conversation_index = temp_convo[1]
	
	#if there are words in the array, and the words are valid conversation
	#starters, start conversation
	if words_in_command.size() > 0:
		if temp_convo.size() == 4:
			add_new_convo_response(command_processor.array_to_string(temp_words_in_command), temp_convo[1])
			conversation = temp_convo[2]
			convo_attempted = temp_convo[3]
		else:
			conversation = temp_convo[0]
	
	if words_in_command.size() == 1 and words_in_command[0] in ["talk", "speak"] and conversation_index == "":
		add_new_convo_response(command_processor.array_to_string(temp_words_in_command), "You can't talk to someone who doesn't exist!")
		conversation = false
		convo_attempted = true
	
	#if there isn't a conversation and conversation hasn't been tried,
	#check words as commands, otherwise continue the conversation
	if not conversation and not convo_attempted:
		add_new_command_response(new_text)
	elif conversation:
		if conversation_index != "":
			if command_processor.conversation.has(conversation_index) and not command_processor.conversation[conversation_index][1]:
				text_index = command_processor.conversation[conversation_index][0]
				command_processor.conversation[conversation_index][1] = true
			
			temp_convo = command_processor.Dialogue.do_conversation(command_processor.all_dialogue, words_in_command, conversation_index, text_index, command_processor.player.money)
			
			add_new_convo_response(command_processor.array_to_string(temp_words_in_command), temp_convo[1])
			
			if temp_convo.size() > 2:
				text_index = temp_convo[2]
				conversation = temp_convo[3]
				conversation_index = temp_convo[4]
				var temp_vars_response = command_processor.conversation_vars(temp_convo[5], conversation_index)
				map.update_visual(command_processor.movement.current_area, command_processor.movement.map_vars)
				if temp_vars_response != null:
					var vars_response = Response.instance()
					add_response_to_game(vars_response)
					vars_response.say(temp_vars_response)


#add whole response without checking the command
func add_new_convo_response(input: String, dialogue: String):
	#create a new response
	var input_response = InputResponse.instance()
	#get the game response for the text entered
	var response = dialogue
	#set the text and finally add the response to the game
	input_response.set_text(input, response)
	add_response_to_game(input_response)


#add the whole response for a command entered
func add_new_command_response(player_input: String) -> void:
	#create a new response
	var input_response = InputResponse.instance()
	#get the game response for the text entered
	var response = command_processor.process_command(player_input)
	#update the map
	map.update_visual(command_processor.movement.current_area, command_processor.movement.map_vars)
	#set the text and finally add the response to the game
	input_response.set_text(player_input, response)
	add_response_to_game(input_response)
	if response == "Quitting game!":
		game_quit = true
		$exitTimer.start(5)


#add the response to the area of responses
func add_response_to_game(response: Control) -> void:
	history_rows.add_child(response)
	#delete responses if there are too many
	delete_history_past_limit()


#delete resposes if there are more than allowed
func delete_history_past_limit() -> void:
	#if there are too many responses
	if history_rows.get_child_count() > max_lines_remembered:
		#get the rows to remove
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		#remove the rows
		for _i in range(rows_to_forget):
			history_rows.get_child(0).queue_free()


func _on_exitTimer_timeout() -> void:
	get_tree().quit()


func _on_CommandProcessor_player_died() -> void:
	$deathMessageTimer.start()


func _on_deathMessageTimer_timeout() -> void:
	dead = true
	add_new_convo_response("You died! To play again, re-run the game!", "Having too little money to be worth their time, thieves 'disposed' of you, ending your adventure here.")
	$deathMessageTimer.stop()
