extends KinematicBody2D

onready var explosion = preload("res://Enemies/Explosion.tscn")
onready var bullet = preload("res://Player/Bullet.tscn")
onready var rocket = preload("res://Player/Rocket.tscn")
var velo = Vector2()
export var rotation_speed = 7.5
export var xspeed = 0
export var yspeed = 0
export var a = 200
var mouse_location
var rot_dir = 0
var current_rotation = 0
var moving = false
var speed_limit = 500
var no_fuel = false
var motion = Vector2.ZERO
var can_fire = true
var can_cooldown = true

func _ready():
	PlayerStats.nohit = true
	MusicPlayer.change_music(MusicPlayer.song1)
	PlayerStats.has_rocket = 0
	no_fuel = false
	PlayerStats.fuel = 100
	PlayerStats.health = 100
	$Fuel_Timer.start()


func get_vector(angle):
	return Vector2(sin(angle), cos(angle))

func _process(delta):
	print(PlayerStats.fire_heat)
	if PlayerStats.fire_heat >= 10:
		can_fire = false
		PlayerStats.cooldown = true
	if PlayerStats.fire_heat <= 0:
		PlayerStats.fire_heat = 0
		can_fire = true
		PlayerStats.cooldown = false
		$Cooldown_timer.start()
	if PlayerStats.get_health() <= 0:
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		get_tree().change_scene("res://Other/Game_Over.tscn")
	motion = move_and_slide(motion)
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		if no_fuel == false:
			if not Input.is_action_pressed("ui_manual_rotation"):
				$AnimationPlayer.play("Moving")
	else:
		$AnimationPlayer.play("Idle")
	if Input.is_action_pressed("ui_manual_rotation"):
		mouse_location = get_local_mouse_position()
		rotation += mouse_location.angle() +deg2rad(90)
	else:
		var axis = get_input_axis()
		if no_fuel == false:
			apply_movement(axis * a * delta)
		rotation = delta * rot_dir
		if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
			rot_dir = -45
		elif Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
			rot_dir = -140
		elif Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
			rot_dir = 45
		elif Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
			rot_dir = 140
		elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): #Rotation
			rot_dir = 280
		elif  Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			rot_dir = 188.5
		elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
			rot_dir = 92.5
		elif Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
			rot_dir = 0
	if PlayerStats.fire_heat > 0 and can_cooldown == true and not Input.is_action_pressed("ui_player_fire"):
		can_cooldown = false
		$Cooldown_timer.start()
		PlayerStats.fire_heat += -0.2
	if Input.is_action_pressed("ui_player_fire") and can_fire == true:
		if PlayerStats.cooldown == false: 
			if PlayerStats.has_rocket > 0:
				can_fire = false
				print(can_fire)
				PlayerStats.set_rocket(0)
				var new_rocket = rocket.instance()
				new_rocket.global_transform = $Position2D.global_transform
				get_parent().add_child(new_rocket)
				$RocketTimer.start()
			
			else:
				can_fire = false
				var new_bullet = bullet.instance()
				SoundPlayer.play(SoundPlayer.shoot1)
				new_bullet.global_transform = $Position2D.global_transform
				get_parent().add_child(new_bullet)
				$Gun_Timer.start()
				PlayerStats.fire_heat += 0.2
		#if no_fuel == false:
			#velo = Vector2(speed_limit, 0).rotated(rotation)
#		move_vec = move_vec.normalize()
		#change_speed()
		#move_and_slide(move_vec * speed_limit)
	#move_and_slide(velo)
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


func _on_Fuel_Timer_timeout():
	PlayerStats.change_fuel(-1)
	if not PlayerStats.has_fuel():
		no_fuel = true
		print("hello")
		$Fuel_Timer.stop()
	if no_fuel == true:
		print("extra time")
		$ExtraTimeTimer.start()

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(speed_limit)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()


func _on_Gun_Timer_timeout():
	can_fire = true



func _on_Area2D_body_entered(body):
	if body.is_in_group("Asteroid"):
		PlayerStats.change_health(-15)
		PlayerStats.nohit = false
	if body.is_in_group("Rammer"):
		PlayerStats.nohit = false
		PlayerStats.change_health(-50)
	if body.is_in_group("Enemy_Bullet"):
		PlayerStats.nohit = false
		PlayerStats.change_health(-10)
	if body.is_in_group("Shooter"):
		PlayerStats.nohit = false
		PlayerStats.change_health(-35)


func _on_ExtraTimeTimer_timeout():
	print("end game")
	get_tree().change_scene("res://Other/Game_Over.tscn")
	


func _on_RocketTimer_timeout():
	can_fire = true
	print("timerend")



func _on_Cooldown_timer_timeout():
	can_cooldown = true
