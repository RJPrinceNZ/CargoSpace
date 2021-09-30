extends StaticBody2D

var a = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	rotation += a*delta

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	a = rand_range(1,-1)
	rotation += 10*a


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
