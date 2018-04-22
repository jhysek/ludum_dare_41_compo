extends Control

onready var game = get_node("/root/Level")

func _ready():
	var parstr = ""
	for par in game.pars:
		parstr += str(par) + "\n"
	$Panel/Pars.text = parstr

func update_stats():
	var strokes = ""
	var plusminus = ""
	var idx = 0

	for stroke in Stats.strokes:
		if stroke == -1:
			break

		var diff = stroke - game.pars[idx]
		var diffsign = ""
		if diff > 0:
			diffsign = "+"
		if diff < 0:
			diffsign = "-"

		strokes += str(stroke) + "\n"
		plusminus += diffsign + " " + str(diff)
		idx += 1

	$Panel/Strokes.text = strokes
	$Panel/Diffs.text = plusminus
