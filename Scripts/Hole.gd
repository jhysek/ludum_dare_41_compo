extends Area2D



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Hole_body_entered(body):
	if body.name == "Ball":
		$SfxHole.play()
		body.finish()