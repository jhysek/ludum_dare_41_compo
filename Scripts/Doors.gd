extends Sprite

var opened = false
var is_child = false
export var color = "red"

func _ready():
	texture = load("res://Assets/door_" + color + ".png")
	if get_parent().is_in_group("Door"):
		is_child = true

func open_silently():
	opened = true
	$Body/Collider.disabled = true
	region_rect = Rect2(113, 0, 112,128)
	$Occluder.hide()
	toggle_children()

func open():
	if not opened:
		opened = true
		if !is_child:
			$SfxOpen.play()
		$Body/Collider.disabled = true
		region_rect = Rect2(113, 0, 112,128)
		$Occluder.hide()
		toggle_children()

func close():
	if opened:
		opened = false
		if !is_child:
			$SfxClose.play()
		$Body/Collider.disabled = false
		region_rect = Rect2(0, 0, 112,128)
		$Occluder.show()
		toggle_children()


func toggle_children():
	for child in get_children():
		if child.is_in_group("Door"):
			if opened:
				child.open()
			else:
				child.close()