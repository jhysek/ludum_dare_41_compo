extends Sprite

var opened = false


func open():
	opened = true
	$Body/Collider.disabled = true
	region_rect = Rect2(113, 0, 112,128)
	$Occluder.hide()
	toggle_children()

func close():
	opened = false
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