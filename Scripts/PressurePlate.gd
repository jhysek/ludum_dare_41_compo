extends Area2D

export var activated = false
export var trigger_node = ""
export var is_switch = false
export var color = "red"
var type = "button"

var doors

func _ready():
	if is_switch:
		type = "switch"

	$Sprite.texture = load("res://Assets/" + type + "_" + color + ".png")
	if trigger_node != "":
		doors =  get_node("/root/Level/" + trigger_node)
	if activated:
		$Sprite.region_rect = Rect2(113, 0, 112, 113)
		if doors:
			doors.open_silently()


func switch_on():
	activated = true
	$Sprite.region_rect = Rect2(113, 0, 112, 113)
	$SfxTrigger.play()
	if doors:
		doors.open()

func switch_off():
	if activated:
		activated = false
		$Sprite.region_rect = Rect2(0, 0, 112, 113)
		if doors:
			doors.close()

func _on_PressurePlate_body_entered(body):
	if body.name == "Ball":
		print(type + "_" + color + ": body entered")
		if not is_switch:
			switch_on()
			$Timer.stop()
		else:
			if activated:
				switch_off()
				$SfxTrigger.play()
			else:
				switch_on()

func _on_PressurePlate_body_exited(body):
	if body.name == "Ball":
		print(type + "_" + color + ": body exited")
		$SfxTrigger.play()
		if not is_switch:
			$Sprite.region_rect = Rect2(0, 0, 112, 113)
			$Timer.start()

func _on_Timer_timeout():
	switch_off()