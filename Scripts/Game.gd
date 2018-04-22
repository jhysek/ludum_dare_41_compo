extends Node2D

var strokes = 0
export var hole = 1
var pars = [2, 3, 5, 6, 5, 8]
var total_holes = 6

func _ready():
	$CanvasLayer/UI/Hole.text = "Hole: " + str(hole)
	$CanvasLayer/UI/Par.text = "Par:    " + str(pars[hole - 1])
	set_process_input(true)

func restart_level():
	get_tree().change_scene("res://Levels/Level" + str(hole) + ".tscn")

func _input(event):
	if Input.is_key_pressed(KEY_R):
		restart_level()

func add_stroke():
	strokes += 1
	$CanvasLayer/UI/Strokes.text = "Strokes: " + str(strokes)

func finished():
	Stats.strokes[hole - 1] = strokes
	$CanvasLayer/UI.update_stats()
	if hole == total_holes:
		print("Game finishe")
		$CanvasLayer/UI/AnimationPlayer.play("GameFinished")
	else:
		print("HOle finishe")
		$CanvasLayer/UI/AnimationPlayer.play("Finished")

func to_next_level():
	if hole < total_holes:
		get_tree().change_scene("res://Levels/Level" + str(hole + 1) + ".tscn")

func _on_Boundaries_body_entered(body):
	if body.name == "Ball":
		restart_level()

	pass # replace with function body
