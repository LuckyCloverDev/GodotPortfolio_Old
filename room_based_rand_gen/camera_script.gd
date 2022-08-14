extends Node2D


var position_to_follow = Vector2()


func _process(_delta: float) -> void:
	position = position_to_follow
	round_pos()

func round_pos():
	position = Vector2(floor(position.x / 192) * 192 + 96, floor(position.y / 192) * 192 + 96)


