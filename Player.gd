extends Area2D

var velocity = Vector2()
export var rotation_speed = 10
export var xspeed = 0
export var yspeed = 0
export var a = 5
export var current_rotation = 0
var moving = false
func _process(delta):
	if Input.is_action_pressed("ui_left"): #Rotation
		current_rotation += rotation_speed
		if current_rotation > 360:
			current_rotation -= 360
			return
		if current_rotation < 0:
			current_rotation += 360
			return
		move(0,0,current_rotation,delta)
	if Input.is_action_pressed("ui_right"):
		current_rotation -= rotation_speed
		if current_rotation > 360:
			current_rotation -= 360
			return
		if current_rotation < 0:
			current_rotation += 360
			return
		move(0,0,current_rotation,delta)
	if Input.is_action_pressed("ui_up"):
		change_speed()
		move(xspeed,yspeed,current_rotation,delta)
	else:
		move(xspeed,yspeed,current_rotation,delta)

func change_speed():
	if current_rotation == 0:
		yspeed += a
	if current_rotation == 10:
		yspeed += a * 0.984807753
		xspeed += a * 0.1736481777
	if current_rotation == 20:
		yspeed += a * 0.9396926208
		xspeed += a * 0.3420201433
	if current_rotation == 30:
		yspeed += a * 0.8660254038
		xspeed += a * 0.5
	if current_rotation == 40:
		yspeed += a * 0.7660444431
		xspeed += a * 0.6427876097
	if current_rotation == 50:
		yspeed += a * 0.6427876097
		xspeed += a * 0.7660444431
	if current_rotation == 60:
		yspeed += a * 0.5
		xspeed += a * 0.8660254038
	if current_rotation == 70:
		xspeed += a * 0.9396926208
		yspeed += a * 0.3420201433
	if current_rotation == 80:
		xspeed += a * 0.984807753
		yspeed += a * 0.1736481777
	if current_rotation == 90:
		xspeed += a
func move(Xspeed, Yspeed, Rotation, delta):
	rotation_degrees += Rotation
	moving = true
	position.x += -Xspeed * delta
	position.y += -Yspeed * delta
	
