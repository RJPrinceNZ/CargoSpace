extends KinematicBody2D

var velocity = Vector2()
export var rotation_speed = 7.5
export var xspeed = 0
export var yspeed = 0
export var a = 5
var rot_dir = 0
var current_rotation = 0
var moving = false
var speed_limit = 100

func _ready():
	current_rotation = 0
func get_vector(angle):
	return Vector2(sin(angle), cos(angle))
	
func _process(delta):
	if Input.is_action_pressed("ui_left"): #Rotation
		rot_dir -= 1
		#current_rotation -= rotation_speed
#		if current_rotation > 360:
#			current_rotation -= 360
#		if current_rotation < 0:
#			current_rotation += 360
		print(current_rotation)
	if Input.is_action_pressed("ui_right"):
		#current_rotation += rotation_speed
		rot_dir += 1
#		if current_rotation > 360:
#			current_rotation -= 360
#		if current_rotation < 0:
#			current_rotation += 360
	rotation = rotation_speed * delta * rot_dir
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed_limit, 0).rotated(rotation)
#		move_vec = move_vec.normalize()
		#change_speed()
		#move_and_slide(move_vec * speed_limit)
	move_and_slide(velocity)
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
	if current_rotation == 100:
		xspeed += a * 0.984807753
		yspeed -= a * 0.1736481777
	if current_rotation == 110:
		xspeed += a * 0.9396926208
		yspeed -= a * 0.3420201433
	if current_rotation == 120:
		yspeed -= a * 0.5
		xspeed += a * 0.8660254038
	if current_rotation == 130:
		yspeed -= a * 0.6427876097
		xspeed += a * 0.7660444431
	if current_rotation == 140:
		yspeed -= a * 0.7660444431
		xspeed += a * 0.6427876097
	if current_rotation == 150:
		yspeed -= a * 0.8660254038
		xspeed += a * 0.5
	if current_rotation == 160:
		yspeed -= a * 0.9396926208
		xspeed += a * 0.3420201433
	if current_rotation == 170:
		yspeed -= a * 0.984807753
		xspeed += a * 0.1736481777
	if current_rotation == 180:
		yspeed -= a
	if current_rotation == 190:
		yspeed -= a * 0.984807753
		xspeed -= a * 0.1736481777
	if current_rotation == 200:
		yspeed -= a * 0.9396926208
		xspeed -= a * 0.3420201433
	if current_rotation == 210:
		yspeed -= a * 0.8660254038
		xspeed -= a * 0.5
	if current_rotation == 220:
		yspeed -= a * 0.7660444431
		xspeed -= a * 0.6427876097
	if current_rotation == 230:
		yspeed -= a * 0.6427876097
		xspeed -= a * 0.7660444431
	if current_rotation == 240:
		yspeed -= a * 0.5
		xspeed -= a * 0.8660254038
	if current_rotation == 250:
		xspeed -= a * 0.9396926208
		yspeed -= a * 0.3420201433
	if current_rotation == 260:
		xspeed -= a * 0.984807753
		yspeed -= a * 0.1736481777
	if current_rotation == 270:
		xspeed -= a
	if current_rotation == 280:
		xspeed -= a * 0.984807753
		yspeed += a * 0.1736481777
	if current_rotation == 290:
		xspeed -= a * 0.9396926208
		yspeed += a * 0.3420201433
	if current_rotation == 300:
		yspeed += a * 0.5
		xspeed -= a * 0.8660254038
	if current_rotation == 310:
		yspeed += a * 0.6427876097
		xspeed -= a * 0.7660444431
	if current_rotation == 320:
		yspeed += a * 0.7660444431
		xspeed -= a * 0.6427876097
	if current_rotation == 330:
		yspeed += a * 0.8660254038
		xspeed -= a * 0.5
	if current_rotation == 340:
		yspeed += a * 0.9396926208
		xspeed -= a * 0.3420201433
	if current_rotation == 350:
		xspeed -= a * 0.1736481777
		yspeed += a * 0.984807753
	if current_rotation == 360:
		yspeed += a
func move(Xspeed, Yspeed, delta):
	moving = true
	position.x += Xspeed * delta
	position.y += -Yspeed * delta
