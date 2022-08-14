tool
extends Area2D

export(String) var level_name = ""
export(Vector2) var player_coords = Vector2()
export(Rect2) var camera_limits = Rect2()
export(Vector2) var door_size = Vector2(8, 8)

var prev_door_size = Vector2(8, 8)


func _process(_delta: float) -> void:
	if door_size != prev_door_size:
		var new_size = RectangleShape2D.new()
		new_size.extents = door_size

		get_child(0).shape = new_size
		
		prev_door_size = door_size


func _on_area_door_area_entered(area: Area2D) -> void:
	if not area.get_groups().has("scene_door"):
		if area.get_parent().get_groups().has("player") and area.name == "player_collision":
			get_child(0).set_deferred("disabled", true)
			get_parent().change_level(level_name, player_coords, camera_limits)
