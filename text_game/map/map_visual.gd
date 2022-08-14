extends PanelContainer


var dirs = ["UP", "DOWN", "LEFT", "RIGHT"]


#take an array, change the visual to match the current area
func update_visual(current_area: String, areas: Dictionary) -> void:
	$mapMargin/VBoxContainer/relevantInfo/text.text = "Layer: %s" % areas[current_area]["LAYER"]
	
	var shop_style = StyleBoxFlat.new()
	shop_style.set_bg_color(Color("ddea04"))
	var safe_style = StyleBoxFlat.new()
	safe_style.set_bg_color(Color("00ff00"))
	var norm_style = StyleBoxFlat.new()
	norm_style.set_bg_color(Color("0f0f10"))
	var blank_style = StyleBoxFlat.new()
	blank_style.set_bg_color(Color("5d5e60"))
	
	var curr_style = StyleBoxFlat.new()
	curr_style.set_bg_color(Color("2e2e60"))
	
	var lock_style = StyleBoxFlat.new()
	lock_style.set_bg_color(Color("ff0000"))
	
	for i in range(9):
		if i%2 == 0:
			for j in range(9):
				get_child(0).get_child(0).get_child(0).get_child(i).get_child(j).set("custom_styles/panel", blank_style)
		else:
			for j in range(5):
				get_child(0).get_child(0).get_child(0).get_child(i).get_child(j).set("custom_styles/panel", blank_style)
	
	if areas[current_area]["safe_space"]:
		$mapMargin/VBoxContainer/mapBoxes/row3/box3.set("custom_styles/panel", safe_style)
	else:
		$mapMargin/VBoxContainer/mapBoxes/row3/box3.set("custom_styles/panel", curr_style)
	
	for tempdir in dirs:
		if areas[current_area][tempdir][0] != "" and areas[current_area][tempdir][1]:
			match tempdir:
				"UP":
					$mapMargin/VBoxContainer/mapBoxes/xSeparator2/separator3.set("custom_styles/panel", lock_style)
				"DOWN":
					$mapMargin/VBoxContainer/mapBoxes/xSeparator3/separator3.set("custom_styles/panel", lock_style)
				"LEFT":
					$mapMargin/VBoxContainer/mapBoxes/row3/separator2.set("custom_styles/panel", lock_style)
				"RIGHT":
					$mapMargin/VBoxContainer/mapBoxes/row3/separator3.set("custom_styles/panel", lock_style)
	
	for turn1 in dirs:
		for turn2 in dirs:
			for turn3 in dirs:
				for turn4 in dirs:
					if areas[current_area][turn1][0] != "":
						match turn1:
							"UP":
								if areas[areas[current_area][turn1][0]]["safe_space"]:
									$mapMargin/VBoxContainer/mapBoxes/row2/box3.set("custom_styles/panel", safe_style)
								else:
									$mapMargin/VBoxContainer/mapBoxes/row2/box3.set("custom_styles/panel", norm_style)
								
								for tempdir in dirs:
									if areas[areas[current_area][turn1][0]][tempdir][1] and areas[areas[current_area][turn1][0]][tempdir][0] != "":
										match tempdir:
											"UP":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator3.set("custom_styles/panel", lock_style)
											"LEFT":
												$mapMargin/VBoxContainer/mapBoxes/row2/separator2.set("custom_styles/panel", lock_style)
											"RIGHT":
												$mapMargin/VBoxContainer/mapBoxes/row2/separator3.set("custom_styles/panel", lock_style)
								
								if areas[areas[current_area][turn1][0]][turn2][0] != "":
									match turn2:
										"UP":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row1/box3.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row1/box3.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"LEFT":
															$mapMargin/VBoxContainer/mapBoxes/row1/separator2.set("custom_styles/panel", lock_style)
														"RIGHT":
															$mapMargin/VBoxContainer/mapBoxes/row1/separator3.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator1.set("custom_styles/panel", lock_style)
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator2.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", norm_style)
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator4.set("custom_styles/panel", lock_style)
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator3.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"RIGHT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", norm_style)
										
										"LEFT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row2/box2.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row2/box2.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"LEFT":
															$mapMargin/VBoxContainer/mapBoxes/row2/separator1.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"UP":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", norm_style)
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", norm_style)
										
										"RIGHT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row2/box4.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row2/box4.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"RIGHT":
															$mapMargin/VBoxContainer/mapBoxes/row2/separator4.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator5.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"UP":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", norm_style)
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator5.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", norm_style)
							
							"DOWN":
								if areas[areas[current_area][turn1][0]]["safe_space"]:
									$mapMargin/VBoxContainer/mapBoxes/row4/box3.set("custom_styles/panel", safe_style)
								else:
									$mapMargin/VBoxContainer/mapBoxes/row4/box3.set("custom_styles/panel", norm_style)
								
								for tempdir in dirs:
									if areas[areas[current_area][turn1][0]][tempdir][1] and areas[areas[current_area][turn1][0]][tempdir][0] != "":
										match tempdir:
											"DOWN":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator3.set("custom_styles/panel", lock_style)
											"LEFT":
												$mapMargin/VBoxContainer/mapBoxes/row4/separator2.set("custom_styles/panel", lock_style)
											"RIGHT":
												$mapMargin/VBoxContainer/mapBoxes/row4/separator3.set("custom_styles/panel", lock_style)
								
								if areas[areas[current_area][turn1][0]][turn2][0] != "":
									match turn2:
										"DOWN":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row5/box3.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row5/box3.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"LEFT":
															$mapMargin/VBoxContainer/mapBoxes/row5/separator2.set("custom_styles/panel", lock_style)
														"RIGHT":
															$mapMargin/VBoxContainer/mapBoxes/row5/separator3.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator1.set("custom_styles/panel", lock_style)
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator2.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row5/separator4.set("custom_styles/panel", lock_style)
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator3.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"RIGHT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
										
										"LEFT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row4/box2.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row4/box2.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"LEFT":
															$mapMargin/VBoxContainer/mapBoxes/row4/separator1.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row5/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
										
										"RIGHT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row4/box4.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row4/box4.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"RIGHT":
															$mapMargin/VBoxContainer/mapBoxes/row4/separator4.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator5.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row5/separator5.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
							
							"LEFT":
								if areas[areas[current_area][turn1][0]]["safe_space"]:
									$mapMargin/VBoxContainer/mapBoxes/row3/box2.set("custom_styles/panel", safe_style)
								else:
									$mapMargin/VBoxContainer/mapBoxes/row3/box2.set("custom_styles/panel", norm_style)
								
								for tempdir in dirs:
									if areas[areas[current_area][turn1][0]][tempdir][1] and areas[areas[current_area][turn1][0]][tempdir][0] != "":
										match tempdir:
											"LEFT":
												$mapMargin/VBoxContainer/mapBoxes/row3/separator1.set("custom_styles/panel", lock_style)
											"DOWN":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator3/separator2.set("custom_styles/panel", lock_style)
											"UP":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator2/separator2.set("custom_styles/panel", lock_style)
								
								if areas[areas[current_area][turn1][0]][turn2][0] != "":
									match turn2:
										"LEFT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row3/box1.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row3/box1.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"DOWN":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator3/separator1.set("custom_styles/panel", lock_style)
														"UP":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator2/separator1.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator1.set("custom_styles/panel", lock_style)
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row4/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator1.set("custom_styles/panel", lock_style)
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row2/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"UP":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", norm_style)
										
										"DOWN":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row4/box2.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row4/box2.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"DOWN":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator2.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row5/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
										
										"UP":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row2/box2.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row2/box2.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"UP":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator2.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box2.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"LEFT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box1.set("custom_styles/panel", norm_style)
													"LEFT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box1.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator1.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box1.set("custom_styles/panel", norm_style)
							
							"RIGHT":
								if areas[areas[current_area][turn1][0]]["safe_space"]:
									$mapMargin/VBoxContainer/mapBoxes/row3/box4.set("custom_styles/panel", safe_style)
								else:
									$mapMargin/VBoxContainer/mapBoxes/row3/box4.set("custom_styles/panel", norm_style)
								
								for tempdir in dirs:
									if areas[areas[current_area][turn1][0]][tempdir][1] and areas[areas[current_area][turn1][0]][tempdir][0] != "":
										match tempdir:
											"RIGHT":
												$mapMargin/VBoxContainer/mapBoxes/row3/separator4.set("custom_styles/panel", lock_style)
											"DOWN":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator3/separator3.set("custom_styles/panel", lock_style)
											"UP":
												$mapMargin/VBoxContainer/mapBoxes/xSeparator2/separator4.set("custom_styles/panel", lock_style)
								
								if areas[areas[current_area][turn1][0]][turn2][0] != "":
									match turn2:
										"RIGHT":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row3/box5.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row3/box5.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"DOWN":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator3/separator4.set("custom_styles/panel", lock_style)
														"UP":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator2/separator4.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator4.set("custom_styles/panel", lock_style)
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row4/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"UP":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator4.set("custom_styles/panel", lock_style)
																	"LEFT":
																		$mapMargin/VBoxContainer/mapBoxes/row2/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"UP":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", norm_style)
										
										"DOWN":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row4/box4.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row4/box4.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"DOWN":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator3.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"DOWN":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row5/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row5/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"RIGHT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row4/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator4/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
										
										"UP":
											if areas[areas[areas[current_area][turn1][0]][turn2][0]]["safe_space"]:
												$mapMargin/VBoxContainer/mapBoxes/row2/box4.set("custom_styles/panel", safe_style)
											else:
												$mapMargin/VBoxContainer/mapBoxes/row2/box4.set("custom_styles/panel", norm_style)
											
											for tempdir in dirs:
												if areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][1] and areas[areas[areas[current_area][turn1][0]][turn2][0]][tempdir][0] != "":
													match tempdir:
														"UP":
															$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator3.set("custom_styles/panel", lock_style)
											
											if areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0] != "":
												match turn3:
													"UP":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row1/box4.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"RIGHT":
																		$mapMargin/VBoxContainer/mapBoxes/row1/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"RIGHT":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row1/box5.set("custom_styles/panel", norm_style)
													"RIGHT":
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]]["safe_space"]:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", safe_style)
														else:
															$mapMargin/VBoxContainer/mapBoxes/row2/box5.set("custom_styles/panel", norm_style)
														
														for tempdir in dirs:
															if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][1] and areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][tempdir][0] != "":
																match tempdir:
																	"DOWN":
																		$mapMargin/VBoxContainer/mapBoxes/xSeparator1/separator4.set("custom_styles/panel", lock_style)
														
														if areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0] != "":
															match turn4:
																"DOWN":
																	if areas[areas[areas[areas[areas[current_area][turn1][0]][turn2][0]][turn3][0]][turn4][0]]["safe_space"]:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", safe_style)
																	else:
																		$mapMargin/VBoxContainer/mapBoxes/row5/box5.set("custom_styles/panel", norm_style)
