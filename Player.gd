extends Area2D

var velocity = Vector2()
export var rotation_speed = 1
export var speed = 50

func _physics_process(delta):
	_control(delta)
func _control(delta):
	var rot_dir = 0
	if Input.is_action_pressed("ui_left"):
		rot_dir +=1
		
	if Input.is_action_pressed("ui_right"):
		rot_dir -=1
	rotation += rotation_speed * rot_dir * delta
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)
