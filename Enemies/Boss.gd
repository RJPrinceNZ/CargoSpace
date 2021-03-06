extends KinematicBody2D

#variables
var hp = 10000
var player
onready var explosion = preload("res://Enemies/Explosion_big.tscn")
onready var bullet = preload("res://Enemies/Boss_Bullet.tscn")
onready var minion = preload("res://Enemies/Boss_mini.tscn")
onready var bomb = preload("res://Enemies/Cluster_bomb.tscn")
var can_fire = true
var current_attack = 0
var rotation_amount = 1
var doing_attack = false

func _ready():
	randomize()
	hp = 10000
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.max_value = hp
	$CanvasLayer/ProgressBar.set_value(hp)

func _process(delta):
	#rng attack chosing
	if current_attack == 0:
		current_attack = randi() % 4 +1
		$Attack_end_timer.start()
	rotation += rotation_amount*delta
	if current_attack == 1 and can_fire == true:
		can_fire = false
		$Timer.start()
		#spin attack
		var new_bullet1 = bullet.instance()
		new_bullet1.global_transform = $Fire_point1.global_transform
		get_parent().add_child(new_bullet1)
		var new_bullet2 = bullet.instance()
		new_bullet2.global_transform = $Fire_point2.global_transform
		get_parent().add_child(new_bullet2)
		var new_bullet3 = bullet.instance()
		new_bullet3.global_transform = $Fire_point3.global_transform
		get_parent().add_child(new_bullet3)
		var new_bullet4 = bullet.instance()
		new_bullet4.global_transform = $Fire_point4.global_transform
		get_parent().add_child(new_bullet4)
	if current_attack == 2:
		if doing_attack == false:
			doing_attack = true
			attack_2()
	if current_attack == 3:
		if doing_attack == false:
			doing_attack = true
			attack_3()
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.set_value(hp)
	if hp <= 0:
		#death animation
		SoundPlayer.play(SoundPlayer.explosion1)
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		queue_free()

func attack_3():
	#summon bomb attack
	var new_bomb1 = bomb.instance()
	new_bomb1.global_transform = $Fire_point1.global_transform
	get_parent().add_child(new_bomb1)
	var new_bomb2 = bomb.instance()
	new_bomb2.global_transform = $Fire_point2.global_transform
	get_parent().add_child(new_bomb2)
	var new_bomb3 = bomb.instance()
	new_bomb3.global_transform = $Fire_point3.global_transform
	get_parent().add_child(new_bomb3)
	var new_bomb4 = bomb.instance()
	new_bomb4.global_transform = $Fire_point4.global_transform
	get_parent().add_child(new_bomb4)

func attack_2():
	#summon minion attack
	var new_minion1 = minion.instance()
	new_minion1.global_transform = $Summon_point1.global_transform
	get_parent().add_child(new_minion1)
	var new_minion2 = minion.instance()
	new_minion2.global_transform = $Summon_point2.global_transform
	get_parent().add_child(new_minion2)
	var new_minion3 = minion.instance()
	new_minion3.global_transform = $Summon_point3.global_transform
	get_parent().add_child(new_minion3)
	var new_minion4 = minion.instance()
	new_minion4.global_transform = $Summon_point4.global_transform
	get_parent().add_child(new_minion4)

#if hit by bullet of player
func _on_HitBox_body_entered(body):
	if body.is_in_group("Bullet"):
		hp += -120
		SoundPlayer.play(SoundPlayer.hit1)

func _on_Attack_end_timer_timeout():
	doing_attack = false
	current_attack = 0

#timer for each bullet firing
func _on_Timer_timeout():
	can_fire = true
