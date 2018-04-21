extends Area2D

var activated = false
export var trigger_node = ""
var doors

func _ready():
	if trigger_node != "":
		doors =  get_node("/root/Level/" + trigger_node)

func switch_on():
	$Sprite.region_rect = Rect2(113, 0, 112, 113)
	activated = true
	if doors:
		doors.open()

func switch_off():
	$Sprite.region_rect = Rect2(0, 0, 112, 113)
	activated = false
	if doors:
		doors.close()

func _on_PressurePlate_body_entered(body):
	if body.name == "Ball":
		$Timer.stop()
		switch_on()

func _on_PressurePlate_body_exited(body):
	if body.name == "Ball":
		$Timer.start()

func _on_Timer_timeout():
	switch_off()