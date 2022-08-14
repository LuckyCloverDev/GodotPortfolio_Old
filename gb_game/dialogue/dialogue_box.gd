extends Control


signal save_game
signal load_game

#options
onready var option0 = $options/option0
onready var option1 = $options/option1
onready var option2 = $options/option2

onready var textlabel = $box_visual/RichTextLabel


var current_actor = ""
var text_indices = {
	"save_or_load" : 0,
	"locked" : 0,
	"no_cave" : 0,
	"testing" : 0,
	"testing2" : 0,
	"testing3"  : 0,
}


#all the dialogue, vars, and choices
var all_dialogue = []

var dialogue_index = 0
var dialogue_indices_run_through = 0

var finished = true
var convo_finished = false
var player_move = true

var on_choice = false
var max_buttons = 2
var current_button = 0

var TEXT_SPEED = 0.04


#starts moving the pointer and loads the first dialogue
func _ready() -> void:
	visible = false
	option0.disabled = true
	option0.visible = false
	option1.disabled = true
	option1.visible = false
	option2.disabled = true
	option2.visible = false
	
	$typeTimer.wait_time = TEXT_SPEED
	$typeTimer.start()
	
	$AnimationPlayer.play("pointer_point")

#loads the next dialogue and finishes loading ahead of time
func _process(_delta: float) -> void:
	if on_choice:
		max_buttons = all_dialogue[dialogue_index].options.size() - 1
		if Input.is_action_just_pressed("ui_left"):
			current_button -= 1
		elif Input.is_action_just_pressed("ui_right"):
			current_button += 1
		
		if current_button < 0:
			current_button = max_buttons
		elif current_button > max_buttons:
			current_button = 0
		
		get_child(3).get_child(current_button).grab_focus()
	
	$pointer.visible = finished


#loads the current dialogue to print
func load_current_dialogue() -> void:
	if finished and (not convo_finished or dialogue_indices_run_through == 0):
		player_move = false
		convo_finished = false
		finished = false
		$box_visual/icon.texture = load("res://dialogue/icons/" + all_dialogue[dialogue_index]["icon"] + ".png")
		textlabel.bbcode_text = all_dialogue[dialogue_index].text
		textlabel.visible_characters = 0
		$typeTimer.start()
		
		if all_dialogue[dialogue_index].has("vars"):
			parse_vars(all_dialogue[dialogue_index]["vars"])
		
		dialogue_vars()
	elif not finished:
		textlabel.visible_characters = textlabel.text.length()
		finished = true
		_on_typeTimer_timeout()
	elif not on_choice:
		exit_dialogue()
	else:
		pass


func dialogue_vars():
	if all_dialogue[dialogue_index].has("next_index"):
		convo_finished = true
		dialogue_indices_run_through += 1
		dialogue_index = all_dialogue[dialogue_index]["next_index"]
	elif all_dialogue[dialogue_index].has("options") and dialogue_indices_run_through != 0:
		dialogue_index += 1
		convo_finished = true
	else:
		dialogue_index += 1
		dialogue_indices_run_through += 1
	
	text_indices[current_actor] = dialogue_index


func parse_vars(vars : Array):
	for _var in vars:
		match _var[0]:
			"save":
				emit_signal("save_game")
			"load":
				emit_signal("load_game")
			"quest":
				pass
			"unlock":
				pass
			"enable_option":
				pass
			_:
				pass


#load the text as a dictionary
func load_character_dialogue(character: String = "testing"):
	var file = File.new()
	file.open("res://dialogue/dialogues.json", file.READ)
	var all_text = JSON.parse(file.get_as_text()).result
	
	current_actor = character
	dialogue_index = text_indices[current_actor]
	all_dialogue = all_text["dialogue"][character]
	
	visible = true


func exit_dialogue():
	all_dialogue = []
	finished = true
	convo_finished = true
	visible = false
	player_move = true
	dialogue_indices_run_through = 0
	textlabel.bbcode_text = ""


func _on_typeTimer_timeout() -> void:
	if textlabel.visible_characters < textlabel.text.length() and textlabel.visible_characters >= 0:
		finished = false
		textlabel.visible_characters += 1
	elif textlabel.visible_characters == textlabel.text.length():
		$typeTimer.stop()
		finished = true
		if all_dialogue[dialogue_index].has("options"):
			on_choice = true
			option0.grab_focus()
			option0.visible = true
			option0.disabled = false
			option0.get_node("button_text").rect_size.x = 240
			option0.get_node("button_text").rect_position.x = 24
			option0.get_child(0).bbcode_text = all_dialogue[dialogue_index].options[0].text
			if all_dialogue[dialogue_index].options.size() > 1:
				option1.visible = true
				option1.disabled = false
				option0.get_node("button_text").rect_size.x = 110
				option0.get_node("button_text").rect_position.x = 12
				option1.get_node("button_text").rect_size.x = 110
				option1.get_node("button_text").rect_position.x = 12
				option1.get_child(0).bbcode_text = all_dialogue[dialogue_index].options[1].text
				if all_dialogue[dialogue_index].options.size() > 2:
					option2.visible = true
					option2.disabled = false
					option0.get_node("button_text").rect_size.x = 70
					option0.get_node("button_text").rect_position.x = 8
					option1.get_node("button_text").rect_size.x = 70
					option1.get_node("button_text").rect_position.x = 8
					option2.get_node("button_text").rect_size.x = 70
					option2.get_node("button_text").rect_position.x = 8
					option2.get_child(0).bbcode_text = all_dialogue[dialogue_index].options[2].text


func end_choice():
	on_choice = false
	option0.disabled = true
	option0.visible = false
	option1.disabled = true
	option1.visible = false
	option2.disabled = true
	option2.visible = false
	load_current_dialogue()


func _on_option_button_pressed(button_num: int) -> void:
	if on_choice:
		if all_dialogue[dialogue_index].has("options") and all_dialogue[dialogue_index].options[button_num].has("goto"):
			dialogue_index = all_dialogue[dialogue_index].options[button_num].goto
			end_choice()
		else:
			exit_dialogue()
	else:
		assert(false, "How was this pressed? There's no choice!")

