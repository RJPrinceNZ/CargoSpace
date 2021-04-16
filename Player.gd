extends Area2D

var speed
var velcity = Vector2()
func _ready():
	pass

func control():
	var dir_rot = 0
	if Input.is_action_pressed("ui_left"):
		dir_rot += 1
	if Input.is_action_pressed("ui_right"):
		dir_rot -= 1
