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
	var total_pars = 0
	var total_strokes = 0
	var total_diff = 0

	for stroke in Stats.strokes:
		if stroke == -1:
			break

		var diff = stroke - game.pars[idx]
		var diffsign = ""
		if diff > 0:
			diffsign = "+"

		total_pars += game.pars[idx]
		total_strokes += stroke
		total_diff += diff

		strokes += str(stroke) + "\n"
		plusminus += diffsign + " " + str(diff) + "\n"
		idx += 1

	if total_diff > 0:
		total_diff = "+ " + str(total_diff)
		$PanelGameFinished/TotalDiff.set("custom_colors/font_color",  Color(1, 0.3, 0.3, 1))
		$Panel/TotalDiff.set("custom_colors/font_color", Color(1, 0.3, 0.3, 1))

	elif total_diff < 0:
		$PanelGameFinished/TotalDiff.set("custom_colors/font_color",  Color(0.3, 1, 0.3))
		$Panel/TotalDiff.set("custom_colors/font_color", Color(0.3, 1, 0.3, 1))


	$Panel/Strokes.text = strokes
	$Panel/Diffs.text = plusminus
	$PanelGameFinished/Strokes.text = strokes
	$PanelGameFinished/Diffs.text = plusminus

	$Panel/Footer.text = "TOTAL             " + str(total_pars)
	$Panel/TotalStrikes.text = str(total_strokes)
	$Panel/TotalDiff.text = str(total_diff)
	$PanelGameFinished/TotalStrikes.text = str(total_strokes)
	$PanelGameFinished/TotalDiff.text = str(total_diff)
	$PanelGameFinished/Footer.text = "TOTAL             " + str(total_pars)

func back_to_menu():
	get_tree().change_scene("res://Scenes/Menu.tscn")