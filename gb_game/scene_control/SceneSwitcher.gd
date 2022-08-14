extends Node


onready var current_level = $starting_area
onready var anim = $AnimationPlayer

var next_level = null
var next_player_location = null

var new_camera_limits = null


func _ready() -> void:
	current_level.get_child(0).get_child(0).get_child(5).current = true
	current_level.connect("level_changed", self, "handle_level_changed")
	MusicPlayer.play("", current_level.level_song)


func handle_level_changed(current_level_name : String, where_player_goes : Vector2, camera_limits : Rect2):
	var next_level_name : String
	
	next_level_name = current_level_name
	
	next_level = load("res://levels/" + next_level_name + ".tscn").instance()
	next_level.get_child(0).z_index = -1
	next_level.z_index = -1
	
	
	if get_child_count() <= 3:
		call_deferred("add_child", next_level)
		next_level.connect("level_changed", self, "handle_level_changed")
	
	next_player_location = where_player_goes
	new_camera_limits = camera_limits
	
	anim.play("fadein")
	
	transfer_data_between_scenes(current_level, next_level)


func transfer_data_between_scenes(old_scene : Node, new_scene : Node):
	new_scene.get_child(0).get_child(0).get_child(0).get_child(0).text_indices = old_scene.get_child(0).get_child(0).get_child(0).get_child(0).text_indices


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		"fadein":
			MusicPlayer.fade_out(MusicPlayer.curr_song)
			
			current_level.clean_up()
			current_level = next_level
			
			current_level.get_child(0).get_child(0).get_child(5).current = true
			
			current_level.get_child(0).get_child(0).position = next_player_location
			
			current_level.get_child(0).get_child(0).get_child(5).current = true
			current_level.get_child(0).get_child(0).get_child(5).limit_top = new_camera_limits.position.x
			current_level.get_child(0).get_child(0).get_child(5).limit_bottom = new_camera_limits.position.y
			current_level.get_child(0).get_child(0).get_child(5).limit_left = new_camera_limits.size.x
			current_level.get_child(0).get_child(0).get_child(5).limit_right = new_camera_limits.size.y
			
			current_level.z_index = 1
			current_level.get_child(0).z_index = 5
			
			next_level = null
			next_player_location = null
			
			anim.play("fadeout")
		"fadeout":
			MusicPlayer.curr_song = current_level.level_song
