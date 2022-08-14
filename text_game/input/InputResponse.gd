extends VBoxContainer


#sets the words to the new text
func set_text(input: String, response: String) -> void:
	#player response
	get_child(0).text = " > " + input
	#game response
	get_child(1).say(response)
