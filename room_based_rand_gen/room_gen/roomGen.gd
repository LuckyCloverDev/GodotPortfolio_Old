extends Node2D


const ROOMS_PER_PATH = 2
const TILE_SIZE = 8
const ROOM_SIZE = Vector2(24, 24)
const LEVEL_SIZE = Vector2(6, 6)

var curr_dir : Array
var prev_dir : Array

var rooms_generated := []
var rooms_next_to := {}

var rooms_in_path = 0
var curr_room_loc : Vector2

var start_room_loc : Vector2
var end_room_loc

var path_to_win = []
var path_to_win_dirs = []
var room_path_count = [0]
var end_found = false


func _ready() -> void:
	randomize()
	gen_start()
	gen_level()


func _process(_delta: float) -> void:
	$CanvasLayer/Label.text = str(($Node2D.position.x - 96)/192) + ", " + str(($Node2D.position.y - 96)/192)
	$Node2D.position_to_follow = $player.position
	
	if Input.is_action_just_pressed("ui_accept"):
		reset()


func reset():
	randomize()
	$player.visible = false
	get_tree().call_group("generated_objects", "queue_free")
	rooms_generated.clear()
	rooms_next_to.clear()
	path_to_win.clear()
	path_to_win_dirs.clear()
	end_found = false
	end_room_loc = Vector2()
	gen_start()
	gen_level()


func gen_start():
	var start_x = randi() % int(LEVEL_SIZE.x)
	var start_y = randi() % int(LEVEL_SIZE.y)
	
	$player.position = Vector2(start_x * TILE_SIZE * ROOM_SIZE.x + 120, start_y * TILE_SIZE * ROOM_SIZE.y + 120)
	
	start_room_loc = Vector2(start_x, start_y)
	curr_room_loc = Vector2(start_x, start_y)
	
	rooms_generated.append(curr_room_loc)


func gen_level():
	$Timer.start()


func new_room(location : Vector2, directions : Array):
	if directions.size() != 0:
		var dir = directions[randi() % directions.size()]
		var temp_dir = ""
		var new_location = Vector2(0, 0)
		
		match dir:
			"UP":
				new_location = location + Vector2(0, -1)
				temp_dir = "DOWN"
			"DOWN":
				new_location = location + Vector2(0, 1)
				temp_dir = "UP"
			"LEFT":
				new_location = location + Vector2(-1, 0)
				temp_dir = "RIGHT"
			"RIGHT":
				new_location = location + Vector2(1, 0)
				temp_dir = "LEFT"
		
		if rooms_next_to.has(vector_to_index(location)) == false:
			rooms_next_to[vector_to_index(location)] = {}
		if rooms_next_to.has(vector_to_index(new_location)) == false:
			rooms_next_to[vector_to_index(new_location)] = {}
		
		rooms_next_to[vector_to_index(location)][dir] = new_location
		rooms_next_to[vector_to_index(new_location)][temp_dir] = location
		
		rooms_generated.append(new_location)
		rooms_in_path += 1
		
		if rooms_in_path == ROOMS_PER_PATH:
			rooms_in_path = 0
			return null
		else:
			return new_location
	else:
		return null


func get_room_dirs(location : Vector2) -> Array:
	var valid = []
	
	if location.y != 0 and rooms_generated.find(Vector2(location.x, location.y-1)) == -1:
		valid.append("UP")
	if location.y != LEVEL_SIZE.y - 1 and rooms_generated.find(Vector2(location.x, location.y+1)) == -1:
		valid.append("DOWN")
	if location.x != 0 and rooms_generated.find(Vector2(location.x-1, location.y)) == -1:
		valid.append("LEFT")
	if location.x != LEVEL_SIZE.x - 1 and rooms_generated.find(Vector2(location.x+1, location.y)) == -1:
		valid.append("RIGHT")
	
	return valid


func set_room_type(room : Dictionary):
	var dirs = []
	
	for i in room:
		if i.to_lower() in ["up", "down", "left", "right"]:
			dirs.append(i.to_lower())
	
	dirs.sort()
	
	if dirs.size() == 1:
		return "1_dir_" + dirs[0] + "_1"
	elif dirs.size() == 2:
		if dirs.has("up") and dirs.has("down"):
			return "2_dir_vert_1"
		elif dirs.has("left") and dirs.has("right"):
			return "2_dir_hor_1"
		else:
			if dirs.has("up"):
				return "2_dir_up_" + dirs[0] + "_1"
			elif dirs.has("down"):
				return "2_dir_down_" + dirs[1] + "_1"
	elif dirs.size() == 3:
		if dirs.has("up"):
			if dirs.has("down"):
				return "3_dir_" + dirs[1] + "_1"
			else:
				return "3_dir_up_1"
		else:
			return "3_dir_down_1"
	elif dirs.size() == 4:
		return "4_dir_1"
	else:
		print(dirs)
		return "HOW???"


func place_rooms():
	for rooms in rooms_next_to:
		var temp_new_room = load("res://rooms/" + rooms_next_to[rooms]["type"] + ".tscn")
		var new_room = temp_new_room.instance()
		add_child(new_room)
		
		new_room.coords = rooms
		new_room.position  = Vector2(int(rooms[0]), int(rooms[3])) * TILE_SIZE * ROOM_SIZE
		new_room.gen_items()
		
		if rooms == vector_to_index(start_room_loc):
			new_room.starting_room()
		
		if rooms_next_to[rooms].has("exit"):
			end_room_loc = rooms
			new_room.exit_room()


func _on_Timer_timeout() -> void:
	var temp = new_room(curr_room_loc, get_room_dirs(curr_room_loc))
	
	if temp != null:
		curr_room_loc = temp
	else:
		for i in rooms_generated:
			temp = new_room(i, get_room_dirs(i))
			
			if temp != null:
				rooms_in_path = 0
				curr_room_loc = temp
				break
		
		if rooms_generated.size() == LEVEL_SIZE.x * LEVEL_SIZE.y:
			rooms_next_to[vector_to_index(curr_room_loc)]["exit"] = true
			
			for rooms in rooms_next_to:
				rooms_next_to[rooms]["type"] = set_room_type(rooms_next_to[rooms])
			
			place_rooms()
			$player.visible = true
			$Timer.stop()
			
			path_to_win.append(vector_to_index(start_room_loc))
			win_path(vector_to_index(start_room_loc))
			check_win_path()
			set_win_path_dirs()
			
			print(path_to_win)
			print(path_to_win_dirs)
			
			room_path()


func room_path():
	for nodes in get_tree().get_nodes_in_group("generated_objects"):
		if nodes.coords in path_to_win:
			nodes.path_room()


func win_path(curr_index : String, last_dir : String = ""):
	var val_dirs = ["UP", "DOWN", "LEFT", "RIGHT"]
	var inval_dirs = ["DOWN", "UP", "RIGHT", "LEFT"]
	
	if rooms_next_to[curr_index].has("exit"):
		end_found = true
	
	var temp_count = 0
	for dir in rooms_next_to[curr_index]:
		if dir in val_dirs:
			temp_count += 1
	
	if not end_found:
		if room_path_count.size() < 1:
			room_path_count.append(0)
		
		for dir in rooms_next_to[curr_index]:
			if dir in val_dirs:
				if temp_count > 2:
					if room_path_count[-1] != 0:
						room_path_count.append(0)
				elif temp_count == 1:
					for i in room_path_count[-1]:
						path_to_win.pop_back()
						path_to_win_dirs.pop_back()
				if last_dir != inval_dirs[val_dirs.find(dir)] and not end_found:
					room_path_count[-1] += 1
					path_to_win.append(vector_to_index(rooms_next_to[curr_index][dir]))
					win_path(vector_to_index(rooms_next_to[curr_index][dir]), dir)


func check_win_path():
	path_to_win.invert()
	
	for _j in range(30):
		for i in range(path_to_win.size() - 2):
			var coords = index_to_vector(path_to_win[i])
			var prev_coords = index_to_vector(path_to_win[i + 1])
			
			var val_changes = [Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)]
			if (not ((rooms_next_to[path_to_win[i]].has("UP") and rooms_next_to[path_to_win[i]]["UP"] == index_to_vector(path_to_win[i + 1])) or (rooms_next_to[path_to_win[i]].has("DOWN") and rooms_next_to[path_to_win[i]]["DOWN"] == index_to_vector(path_to_win[i + 1])) or (rooms_next_to[path_to_win[i]].has("LEFT") and rooms_next_to[path_to_win[i]]["LEFT"] == index_to_vector(path_to_win[i + 1])) or (rooms_next_to[path_to_win[i]].has("RIGHT") and rooms_next_to[path_to_win[i]]["RIGHT"] == index_to_vector(path_to_win[i + 1])))) or (prev_coords != coords + val_changes[0] and prev_coords != coords + val_changes[1] and prev_coords != coords + val_changes[2] and prev_coords != coords + val_changes[3]):
				path_to_win.erase(vector_to_index(prev_coords))
				break
	
	path_to_win.invert()


func set_win_path_dirs():
	for i in range(path_to_win.size() - 1):
		if rooms_next_to[path_to_win[i]].has("UP") and index_to_vector(path_to_win[i + 1]) == rooms_next_to[path_to_win[i]]["UP"]:
			path_to_win_dirs.append("UP")
		elif rooms_next_to[path_to_win[i]].has("DOWN") and index_to_vector(path_to_win[i + 1]) == rooms_next_to[path_to_win[i]]["DOWN"]:
			path_to_win_dirs.append("DOWN")
		elif rooms_next_to[path_to_win[i]].has("LEFT") and index_to_vector(path_to_win[i + 1]) == rooms_next_to[path_to_win[i]]["LEFT"]:
			path_to_win_dirs.append("LEFT")
		elif rooms_next_to[path_to_win[i]].has("RIGHT") and index_to_vector(path_to_win[i + 1]) == rooms_next_to[path_to_win[i]]["RIGHT"]:
			path_to_win_dirs.append("RIGHT")


func index_to_vector(index : String) -> Vector2:
	return Vector2(int(index.substr(0, 1)), int(index.substr(2, 3)))


func vector_to_index(vector : Vector2) -> String:
	return str(vector.x) + ", " + str(vector.y)

