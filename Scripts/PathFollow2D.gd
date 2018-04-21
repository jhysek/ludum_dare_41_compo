extends PathFollow2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	offset += delta * 80

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
