extends Area2D

export var ROTATION = 1
export var SPEED = 50
var moving = false

func _process(delta):
	moving = false
	if Input.is_action_pressed("ui_left"):
		move(0,0,-ROTATION,delta)
	if Input.is_action_pressed("ui_right"):
		move(0,0,ROTATION,delta)
	if Input.is_action_pressed("ui_up"):
		move(0,-SPEED,0,delta)
	if Input.is_action_pressed("ui_down"):
		move(0,SPEED,0,delta)

func move(xspeed, yspeed, Rotation, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
	rotation_degrees += Rotation
	moving = true
