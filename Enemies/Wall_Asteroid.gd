extends StaticBody2D

#asteroids that makes up the walls

var a = 1


func _process(delta):
	rotation += a*delta

func _ready():
	randomize()
	a = rand_range(1,-1)
	rotation += 10*a
