extends KinematicBody2D


const SPEED = 75

var velocity = Vector2()
var moving = false


func _ready():
	position.x = int(position.x / 8) * 8 + 4
	position.y = int(position.y / 8) * 8 + 4


func _physics_process(_delta: float) -> void:
	velocity.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocity.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if velocity.x < 0 and not moving and not $RayCastLeft.is_colliding():
		$Sprite.animation = "WalkLeft"
		$Tween.interpolate_property(self, "position", position, Vector2(position.x - 16, position.y), 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		moving  = true
	
	if velocity.x > 0 and not moving and not $RayCastRight.is_colliding():
		$Sprite.animation = "WalkRight"
		$Tween.interpolate_property(self, "position", position, Vector2(position.x + 16, position.y), 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		moving  = true
	
	if velocity.y < 0 and not moving and not $RayCastUp.is_colliding():
		$Sprite.animation = "WalkUp"
		$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y - 16), 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		moving = true
	
	if velocity.y > 0 and not moving and not $RayCastDown.is_colliding():
		$Sprite.animation = "WalkDown"
		$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y + 16), 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		moving = true
	
	#var _temp = move_and_slide(velocity * SPEED)


func _on_Tween_tween_completed(_object, _key):
	moving = false







