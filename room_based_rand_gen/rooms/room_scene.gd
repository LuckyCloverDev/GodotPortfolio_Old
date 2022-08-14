extends Node2D


const ROOM_SIZE = Vector2(12, 12)
const BORDER_SIZE = 1

var coords : String

onready var exitPortal = load("res://ExitPortal.tscn")


func _ready() -> void:
	set_basic_room()


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		set_basic_room()


func set_basic_room():
	clear_room()
	randomize()
	gen_items()
	gen_chest()


func path_room():
	for x in range(ROOM_SIZE.x):
		for y in range(ROOM_SIZE.y):
			if get_child(0).get_cell(x, y) == -1 or get_child(0).get_cell(x, y) == 0:
				get_child(0).set_cell(x, y, 1)



func starting_room():
	clear_room()
	
	get_child(0).set_cell(5, 5, 4)
	get_child(0).update_bitmask_region()
	


func exit_room():
	#clear_room()
	
	#get_child(0).set_cell(ROOM_SIZE.x/2 - 1, ROOM_SIZE.y/2 - 1, 3)
	#get_child(0).set_cell(ROOM_SIZE.x/2 - 1, ROOM_SIZE.y/2, 3)
	#get_child(0).set_cell(ROOM_SIZE.x/2, ROOM_SIZE.y/2 - 1, 3)
	#get_child(0).set_cell(ROOM_SIZE.x/2, ROOM_SIZE.y/2, 3)
	
	var _exit = exitPortal.instance()
	add_child(_exit)
	_exit.position = ROOM_SIZE * 8
	
	get_child(0).update_bitmask_region()


func clear_room():
	for x in range(ROOM_SIZE.x):
		for y in range(ROOM_SIZE.y):
			if get_child(0).get_cell(x, y) == -1 or get_child(0).get_cell(x, y) == 1 or get_child(0).get_cell(x, y) == 2:
				get_child(0).set_cell(x, y, 0)


func gen_items():
	for x in range(BORDER_SIZE, ROOM_SIZE.x - BORDER_SIZE):
		for y in range(BORDER_SIZE, ROOM_SIZE.y - BORDER_SIZE):
			if randf() <= 0.1 and (x < BORDER_SIZE + 1 or x >= ROOM_SIZE.x - BORDER_SIZE - 1 or y < BORDER_SIZE + 1 or y >= ROOM_SIZE.y - BORDER_SIZE -1):
				if range(ROOM_SIZE.x/2 - 1, ROOM_SIZE.x/2 + 1).find(x) == -1  and range(ROOM_SIZE.y/2 - 1, ROOM_SIZE.y/2 + 1).find(y) == -1:
					get_child(0).set_cell(x, y, 1)


func gen_chest():
	if randf() <= 0.25:
		get_child(0).set_cell(ROOM_SIZE.x/2 - 1, ROOM_SIZE.y/2 - 1, 2)

