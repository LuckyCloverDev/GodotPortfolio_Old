extends Node


const valid_items = {
	"waffle" : {"name" : "Waffle", "valid_names" : ["waffle"], "stats" : ["stamina", 25], "desc" : "A fluffy breakfast item of syrupy goodness!"},
	"tempura" : {"name" : "Tempura", "valid_names" : ["tempura", "fish"], "stats" : ["stamina", 50], "desc" : "Sushi, but without the seaweed, the rice, and everything else. Just the fish!"},
	"apple" : {"name" : "Apple", "valid_names" : ["apple", "cromchy"], "stats" : ["stamina", 10], "desc" : "A simply sublime piece of fruit, good for the soul"},
	
	"key1" : {"name" : "Ancient Key", "valid_names" : ["ancient", "key1"], "is_key" : true, "stats" : ["area", "c1", "RIGHT", "c2", "LEFT"], "desc" : "A key brittle enough to break after one use", "lock_type" : "ancient locks"},
	"key2" : {"name" : "Old Key", "valid_names" : ["old", "key2"], "is_key" : true, "stats" : ["area", "c1", "DOWN", "d1", "UP"], "desc" : "An old key that has reached its limit", "lock_type" : "old locks"},
	"key3" : {"name" : "Digital Key", "valid_names" : ["digital", "key3"], "is_key" : true, "stats" : ["area", "f3", "UP", "e3", "DOWN"], "desc" : "A new keycard made for modern card slots.", "lock_type" : "digital locks"},
	
	"ladder" : {"name" : "ladder", "climable" : true}
}

const items_array = ["Waffle", "Tempura", "ladder", "Apple"]


#checks an item to see if it's valid
static func check_item(item_to_check: String) -> bool:
	for items in valid_items:
		if item_to_check.to_lower() == items:
			#if the item exists, return true
			return true
	#otherwise return false
	return false


#get a random item
static func random_item(item_selection: Array) -> String:
	#get a number within the size of the item array
	var random_value = randi() % item_selection.size()
	#return the item that goes with the number
	return item_selection[random_value]
