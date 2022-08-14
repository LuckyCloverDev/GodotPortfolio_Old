extends Node2D


signal level_changed

export (String) var level_song = "forest_theme"


func clean_up():
	call_deferred("queue_free")


func change_level(level_name: String, player_coords: Vector2, camera_limits: Rect2) -> void:
	emit_signal("level_changed", level_name, player_coords, camera_limits)
