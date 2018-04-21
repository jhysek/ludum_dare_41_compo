extends Node2D

var strokes = 0

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Levels/Level0.tscn")

func add_stroke():
	strokes += 1
	$CanvasLayer/UI/Strokes.text = "Strokes: " + str(strokes)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
