extends Node2D


onready var tween_out = get_node("tween_out")
onready var tween_in = get_node("tween_in")

export var trans_duration = 0.5
export var trans_type = 1

var curr_song = ""


func play(prev_song : String, new_song : String):
	if new_song:
		if prev_song != new_song:
			curr_song = new_song
		get_node(curr_song).play()
		fade_in(curr_song)


func fade_in(stream_player):
	tween_in.interpolate_property(get_node(stream_player), "volume_db", -80, 0, trans_duration, trans_type, Tween.EASE_IN, 0)
	tween_in.start()


func fade_out(stream_player):
	tween_out.interpolate_property(get_node(stream_player), "volume_db", 0, -80, trans_duration, trans_type, Tween.EASE_IN, 0)
	tween_out.start()


func replay_song() -> void:
	play(curr_song, curr_song)
	fade_in(curr_song)


func _on_Tween_tween_completed(object: Object, _key: NodePath) -> void:
	object.stop()
	tween_out.stop(get_node(curr_song), "volume_db")
	object.volume_db = 0
	play("", curr_song)


func _on_tween_in_tween_completed(_object: Object, _key: NodePath) -> void:
	tween_in.stop(get_node(curr_song), "volume_db")
