extends Area2D

var activated = false
export var trigger_node = ""
export var is_switch = false

var doors

func _ready():
	if trigger_node != "":
		doors =  get_node("/root/Level/" + trigger_node)

func switch_on():
	if not activated:
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
		$SfxTrigger.play()
		if not is_switch:
			$Sprite.region_rect = Rect2(0, 0, 112, 113)
			$Timer.start()

func _on_Timer_timeout():
	switch_off()