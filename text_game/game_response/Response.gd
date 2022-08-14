extends Label


var cur_text = ""


#set the amount of time in between letters and start timer
func _ready() -> void:
	$type_timer.wait_time = 0.025
	$type_timer.start()


#set text to message
func say(message: String):
	text = message
	visible_characters = 0


#add another letter
func _on_type_timer_timeout() -> void:
	if visible_characters < text.length():
		visible_characters += 1
