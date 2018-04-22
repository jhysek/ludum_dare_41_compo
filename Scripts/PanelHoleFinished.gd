extends Panel

onready var game = get_node("/root/Level")


func _on_Button_pressed():
	game.to_next_level()
