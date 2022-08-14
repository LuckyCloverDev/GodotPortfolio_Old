extends KinematicBody2D


const TILE_SIZE = 8

onready var d_box = $CanvasLayer/dialogue_box

var save_dict = {
	"dialogue_vars" : {}
}

var turn = false
var move_speed = 1
var velocity = Vector2()

var can_talk = false
var curr_person = ""
var curr_index = 0

var can_travel = false
var next_level = ""
var curr_door : Area2D
var next_location = Vector2()
var camera_limits = Rect2()

var can_save = false

var l = 0
var r = 0
var u = 0
var d = 0


func _ready() -> void:
	var _temp = $CanvasLayer/dialogue_box.connect("save_game", self, "save_game")
	_temp = $CanvasLayer/dialogue_box.connect("load_game", self, "load_game")


func _physics_process(_delta: float) -> void:
	movement()
	if not d_box.on_choice:
		if can_talk and Input.is_action_just_pressed("ui_accept"):
			d_box.load_character_dialogue(curr_person)
			d_box.load_current_dialogue()
		elif can_travel and Input.is_action_just_pressed("ui_accept"):
			curr_door.get_child(0).set_deferred("disabled", true)
			get_parent().get_parent().change_level(next_level, next_location, camera_limits)
		elif can_save and Input.is_action_just_pressed("ui_accept"):
			d_box.load_character_dialogue("save_or_load")
			d_box.load_current_dialogue()


func movement():
	if l == 0 and r == 0 and d == 0 and u == 0:
		turn = false
		movement_input()
	
	if u != 0:
		global_position.y -= move_speed
		u -= move_speed
	if d != 0:
		global_position.y += move_speed
		d -= move_speed
	if l != 0:
		global_position.x -= move_speed
		l -= move_speed
	if r != 0:
		global_position.x += move_speed
		r -= move_speed


func movement_input():
	if d_box.player_move:
		if Input.is_action_pressed("ui_up") and not turn:
			if not $U.is_colliding() and not $U2.is_colliding():
				u = TILE_SIZE
			$AnimationPlayer.play("walkup")
			$speech_box.position = Vector2(0, 0)
			turn = true
		if Input.is_action_pressed("ui_down") and not turn:
			if not $D.is_colliding() and not $D2.is_colliding():
				d = TILE_SIZE
			$AnimationPlayer.play("walkdown")
			$speech_box.position = Vector2(0, 8)
			turn = true
		if Input.is_action_pressed("ui_left") and not turn:
			if not $L.is_colliding():
				l = TILE_SIZE
			$AnimationPlayer.play("walkleft")
			$speech_box.position = Vector2(-8, 4)
			turn = true
		if Input.is_action_pressed("ui_right") and not turn:
			if not $R.is_colliding():
				r = TILE_SIZE
			$AnimationPlayer.play("walkright")
			$speech_box.position = Vector2(8, 4)
			turn = true


func save_game():
	var dir = Directory.new()
	if not dir.dir_exists("res://saves/"):
		dir.make_dir_recursive("res://saves/")
	
	var new_save = File.new()
	var _err = new_save.open_encrypted_with_pass("res://saves/save1.tres", File.WRITE, "I BET YOU'D NEVER THINK THIS WAS THE PASSWORD")
	
	save_dict["dialogue_vars"] = get_child(0).get_child(0).text_indices
	
	new_save.store_var(save_dict)
	new_save.close()


func load_game():
	var dir = Directory.new()
	
	if not dir.file_exists("res://saves/save1.tres"):
		print("No save file here!")
		return
	
	var load_save = File.new()
	var _err = load_save.open_encrypted_with_pass("res://saves/save1.tres", File.READ, "I BET YOU'D NEVER THINK THIS WAS THE PASSWORD")
	
	get_child(0).get_child(0).text_indices = load_save.get_var(true).dialogue_vars
	
	load_save.close()


func _on_speech_box_body_entered(body: Node) -> void:
	if body.get_groups().has("actor"):
		curr_person = body.actor_name
		curr_index = body.dialogue_index
		can_talk = true


func _on_speech_box_body_exited(_body: Node) -> void:
	curr_person = ""
	curr_index = 0
	can_talk = false


func _on_speech_box_area_entered(area: Area2D) -> void:
	if area.get_groups().has("area_door"):
		next_level = area.level_name
		next_location = area.player_coords
		camera_limits = area.camera_limits
		can_travel = true
		curr_door = area
	elif area.get_groups().has("save_shrine"):
		can_save = true


func _on_speech_box_area_exited(_area: Area2D) -> void:
	next_level = ""
	next_location = Vector2()
	camera_limits = Rect2()
	can_travel = false
	curr_door = null
	can_save = false


func _on_Timer_timeout() -> void:
	$speech_box/speech_collider.set_deferred("disabled", false)
