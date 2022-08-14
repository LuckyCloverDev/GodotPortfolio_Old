extends Node


const valid_convo_responses = ["yes", "no", "talk", "speak", "yell", "leave", "disco"]


#load the text as a dictionary
static func load_text() -> Dictionary:
	var file= File.new()
	file.open("res://game_response/dialogues.json",file.READ)
	var my_dialogue = JSON.parse(file.get_as_text()).result
	
	return my_dialogue


#return whether selected dialogue has options or not
static func has_options(dialogue : Dictionary):
	return dialogue.has("options")


#return options in a dictionary
static func options(dialogue : Dictionary):
	if dialogue.has("options"):
		return dialogue["options"]
	else:
		return []


#return valid responses if an invalid response is entered
static func invalid_answer(dialogue_responses : Dictionary, player_input : Array):
	#response cannot be used in a conversation, display valid responses but not passwords and easter eggs
	var responses = "Thats not a valid response. Valid responses are as follows:\n"
	var valid_responses = []
	
	#add all valid responses to array
	for response in valid_convo_responses:
		for i in range(0, dialogue_responses["options"].size()):
			if response in dialogue_responses["options"][i]["choice"]:
				valid_responses.append(response)
	
	#turn array into string of options
	for response in valid_responses:
		if valid_responses.find(response) == valid_responses.size() - 1:
			responses += response
		else:
			responses += response + ", "
	
	return [player_input, responses]


#use all variables to create an array to return
static func return_response(cont_con : bool, option : Dictionary, input : Array, conversation : Dictionary, person : String, current_index : int, money : int):
	var finished = ""
	var vars_to_change = []
	var new_index = option["goto"]
	
	if current_index == 0:
		if conversation["dialogue"][person][current_index].has("var_to_change"):
			for vars in conversation["dialogue"][person][current_index]["var_to_change"]:
				vars_to_change.append(vars)
	
	#if this option has a variable to change
	if option.has("var_to_change"):
		for vars in option["var_to_change"]:
			match vars[0]:
				"money":
					if money + vars[1] < 0:
						new_index = vars[2]
					else:
						vars_to_change.append(vars)
						if vars.size() > 3:
							vars_to_change.append(vars[3])
				_:
					vars_to_change.append(vars)
	
	#add all changeable variables to array
	if conversation["dialogue"][person][new_index].has("var_to_change"):
		for vars in conversation["dialogue"][person][new_index]["var_to_change"]:
			vars_to_change.append(vars)
	
	#checks if the new conversation branch continues
	cont_con = conversation["dialogue"][person][new_index].has("options")
	
	#sets whether or not conversation ending is displayed
	if not cont_con:
		finished = "\nConversation finished!"
	
	#return final array
	return [input, conversation["dialogue"][person][new_index]["text"] + finished, new_index, cont_con, person, vars_to_change]


#run through all dialogue in a conversation
static func do_conversation(all_dialogue : Dictionary, player_input: Array, person: String, text_index: int, money: int) -> Array:
	#load the conversations as a dictionary
	var dialogue_responses = all_dialogue
	var has_choices = has_options(dialogue_responses["dialogue"][person][text_index])
	
	#Otherwise, if the command is valid, check if the command is valid for
	#the current question. If it is, continue the convo if there are more
	#options, and end the convo if there are no more options.
	var response_in_dict = false
	if has_choices:
		for i in dialogue_responses["dialogue"][person][text_index]["options"]:
			if player_input[0] in i["choice"]:
				response_in_dict = true
	
	#add all valid options to an array
	var new_text_index = options(dialogue_responses["dialogue"][person][text_index])
	
	#check through options and return text
	##### return [player text, current dialogue, text index, conversation?, name of person, variable to change] #####
	##### return [player text, error response] #####
	if has_choices:
		if response_in_dict or player_input[0] in valid_convo_responses:
			for i in new_text_index:
				#if the input matches a valid option
				if player_input[0] in i["choice"] and i["enabled"]:
					#if the dialogue after this has options
					if has_options(dialogue_responses["dialogue"][person][i["goto"]]):
						return return_response(true, i, player_input, dialogue_responses, person, text_index, money)
					#if the next one is the end of the conversation
					else:
						return return_response(false, i, player_input, dialogue_responses, person, text_index, money)
			
			#valid response, but not valid for the current question
			if player_input[0] in ["talk", "speak"]:
				return [player_input, dialogue_responses["dialogue"][person][text_index]["text"]]
			else:
				return [player_input, "While that is a valid response, I don't think it should be used here."]
		else:
			return invalid_answer(dialogue_responses["dialogue"][person][text_index], player_input)
	#current text index doesn't have options
	else:
		#if there is a changeable variable
		if dialogue_responses["dialogue"][person][text_index].has("var_to_change"):
			return [player_input, dialogue_responses["dialogue"][person][text_index]["text"] + "\nConversation finished", text_index, false, person, dialogue_responses["dialogue"][person][text_index]["var_to_change"]]
		#if there is no changeable variable
		else:
			return [player_input, dialogue_responses["dialogue"][person][text_index]["text"] + "\nConversation finished", text_index, false, person, []]
