extends Node2D


export(Gradient) var magic_gradient

const Items = preload("res://items/item_generator.gd")

onready var magic_bar = $MarginContainer/VBoxContainer/HBoxContainer2/magic
onready var money_visual = $MarginContainer/VBoxContainer/MarginContainer/HBoxContainer3/moneyLabel

var inventory := []
var money := 0
var money_added := 0
var money_increment := 0

var max_magic := 15
var magic := 15
var luck := randi()%5 + 3

var magic_loss := 0


#set bar colors
func _ready() -> void:
	magic_bar.max_value = max_magic
	magic_bar.tint_progress = magic_gradient.interpolate(magic_bar.ratio)


#print out inventory nicely
func format_inv():
	if inventory.size() == 0:
		return "You have no items!"
	else:
		var inv_formatted = ""
		for i in range(0, inventory.size()):
			match Items.valid_items[inventory[i][0]]["stats"][0]:
				"stamina":
					inv_formatted += "%s(%s); Restores %s %s\n" % [inventory[i][1], inventory[i][2], Items.valid_items[inventory[i][0]]["stats"][1], Items.valid_items[inventory[i][0]]["stats"][0]]
				"area":
					inv_formatted += "%s; A key that can open %s\n" % [inventory[i][1], Items.valid_items[inventory[i][0]]["lock_type"]]
		
		return inv_formatted


#add new item to inventory
func new_item(item: Array) -> String:
	#item array formatted as [item exists?, item name/response]
	#item[0] is a boolean checking if the item is valid
	if item[0]:
		if Items.valid_items[item[1]].has("climable"):
			return "You can't take that, it's for climbing!"
		
		var has = [false, -1]
		for i in range(inventory.size()):
			if inventory[i].has(item[1]):
				has = [true, i]
		
		if has[0]:
			inventory[has[1]][2] += 1
		else:
			inventory.append([item[1], Items.valid_items[item[1]]["name"], 1])
		
		return "Taken %s: %s" % [Items.valid_items[item[1]]["name"], Items.valid_items[item[1]]["desc"]]
	else:
		#item[1] is either an item or a response
		#if item[1] is blank, then it has no custom response, so the default is used
		if item[1] == "":
			return "That item doesn't exist!"
		else:
			#returns the custom response
			return item[1]


#check if an item is in the inventory, and if so, return the items variables
func inventory_check(item: String) -> Array:
	for items in inventory:
		if Items.valid_items[items[0]]["valid_names"].has(item):
			return [items[1], Items.valid_items[items[0]]["stats"], Items.valid_items[items[0]]["valid_names"], Items.valid_items[items[0]].has("is_key")]
	
	return []


func use_item(item_data: Array, key_checked: bool) -> String:
	if item_data.size() != 0:
		var has = [false, -1]
		for i in range(inventory.size()):
			if item_data[2].has(inventory[i][0]):
				has = [true, i]
		
		if inventory[has[1]][2] - 1 == 0:
			if item_data[3] and key_checked:
				inventory.remove(has[1])
				return "You used the key to unlock the door!"
			elif item_data[3] and not key_checked:
				return "You can't unlock that door from here!"
			else:
				inventory.remove(item_data[0])
			
		else:
			inventory[has[1]][2] -= 1
		
		match item_data[1][0]:
			"stamina":
				var _eh = use_magic(item_data[1][1])
				return "Used %s!" % item_data[0]
			"area":
				return item_data[0]
			_:
				pass
	
	return "You don't have that item!"


#changes magic value
func use_magic(amount: int) -> Array:
	#changes magic value while the loss is more than 0
	if magic_loss != amount:
		magic_loss += amount
	
	if magic_loss != 0:
		$magic_timer.start()
	
	return ["Stamina at %s percent" % int((magic + amount)/float(max_magic)*100), false]


#changes money value
func gain_money(amount: int) -> void:
	#changes money value while gain is not 0
	if money_added != amount:
		money_added += amount
	
	if money_added != 0:
		$money_timer.start()


#changes health value, updates the bars, and repeats until value is equal to 0
func magic_timer_timeout() -> void:
	if magic_loss != 0:
		if magic_loss < 0:
			magic -= 1
			magic_loss += 1
		elif magic_loss > 0:
			magic += 1
			magic_loss -= 1
	
	update_bars()
	$magic_timer.stop()
	var _eh = use_magic(magic_loss)


#changes money value, updates value, and repeats until all the money has been
#added
func _on_money_timer_timeout() -> void:
	if money_added != 0:
		if money_added <= -10:
			money -= 10
			money_added += 10
		elif money_added > -10 and money_added < 0:
			money -= 1
			money_added += 1
		elif money_added >= 10:
			money += 10
			money_added -= 10
		else:
			money += 1
			money_added -= 1
	
	$money_timer.stop()
	money_visual.text = "%010d" % money#str(money)
	gain_money(money_added)


#makes sure that values aren't out of range, then calls the update bar functions
func update_bars() -> void:
	if magic > max_magic:
		magic = max_magic
	elif magic < 0:
		magic = 0
	
	magic_bar.value = magic


#updates magic bar
func _on_value_changed_magic(_new_value) -> void:
	magic_bar.tint_progress = magic_gradient.interpolate(magic_bar.ratio)

