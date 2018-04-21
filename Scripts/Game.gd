extends Node2D

var strokes = 0
export var hole = 1
var pars = [2, 4]
var total_holes = 2

func _ready():
	$CanvasLayer/UI/Hole.text = "Hole: " + str(hole)
	$CanvasLayer/UI/Par.text = "Par:    " + str(pars[hole - 1])
	set_process_input(true)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Levels/Level" + str(hole) + ".tscn")

func add_stroke():
	strokes += 1
	$CanvasLayer/UI/Strokes.text = "Strokes: " + str(strokes)

func finished():
	if hole < total_holes:
		get_tree().change_scene("res://Levels/Level" + str(hole + 1) + ".tscn")