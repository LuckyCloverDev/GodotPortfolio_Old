extends LineEdit

func _ready() -> void:
	grab_focus()


func _on_Input_text_entered(_new_text: String) -> void:
	 clear()
