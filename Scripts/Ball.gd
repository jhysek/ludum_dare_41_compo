extends RigidBody2D

var aiming = false
onready var camera = $Camera
onready var debug = get_node("/root/Level/CanvasLayer/Label")
onready var game  = get_node("/root/Level")

func _ready():
	set_process_input(true)


func _input(event):
	if (event is InputEventMouseMotion && aiming):
		$Line.set_point_position(1, get_global_mouse_position() - position)

	if (event is InputEventMouseButton && !event.pressed && aiming):
		print("released")
		apply_impulse(Vector2(0,0), Vector2($Line.get_point_position(1) * -2))
		aiming = false
		game.add_stroke()
		$SfxStroke.play()
		$Line.hide()


func _on_Handle_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print("pressed")
		aiming = true
		$Line.set_point_position(0, Vector2(0,0))
		$Line.set_point_position(1, get_global_mouse_position() - position)
		$Line.show()

func finish():
	hide()
	set_linear_velocity(Vector2(0,0))
	game.finished()

func dropped():
	$SfxDrop.play()
