extends KinematicBody2D

var hp = 15000
var player
onready var explosion = preload("res://Enemies/Explosion_big.tscn")
onready var bullet = preload("res://Enemies/Enemy_Bullet.tscn")
var found_player = false
var can_fire = true
var current_attack = 0
var rotation_amount = 1
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 15000
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.max_value = hp
	$CanvasLayer/ProgressBar.set_value(hp)

func _process(delta):
	print(current_attack)
	if current_attack == 0:
		current_attack = randi() % 3 +1
		$Attack_end_timer.start()
	rotation += rotation_amount*delta
	if current_attack == 1 and can_fire == true:
		can_fire = false
		$Timer.start()
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
		pass
	if current_attack == 3:
		pass
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.set_value(hp)
	if hp <= 0:
		SoundPlayer.play(SoundPlayer.explosion1)
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		queue_free()


func _on_HitBox_body_entered(body):
	if body.is_in_group("Bullet"):
		hp += -20


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		found_player = true
		player = body



func _on_Attack_end_timer_timeout():
	current_attack = 0


func _on_Timer_timeout():
	can_fire = true
