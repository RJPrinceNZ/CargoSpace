extends KinematicBody2D

#enemy that shoots bullets and runs away to avoid getting hit

onready var explosion = preload("res://Enemies/Explosion.tscn")
onready var bullet = preload("res://Enemies/Enemy_Bullet.tscn")
var player
var follow_player = false
var movespeed = 50
var hp = 250
var movement = Vector2.ZERO
var can_fire = true

func _physics_process(delta):
	if hp <= 0:
		can_fire = false
		SoundPlayer.play(SoundPlayer.explosion1)
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		queue_free()
	if follow_player == true:
		look_at(player.position)
		if can_fire == true:
			can_fire = false
			var new_bullet = bullet.instance()
			new_bullet.global_transform = $Position2D.global_transform
			get_parent().add_child(new_bullet)
			$Shooter_Timer.start()
		var velocity = position.direction_to(player.position) * -movespeed
		move_and_slide(velocity, Vector2.UP)
		
	
func _ready():
	pass



func _on_Shooter_Timer_timeout():
	can_fire = true


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		follow_player = true
		player = body
		look_at(player.position)


func _on_DamageBox_body_entered(body):
	if body.name == "Player":
		hp = 0
	if body.is_in_group("Bullet"):
		hp += -120
		SoundPlayer.play(SoundPlayer.hit1)
	if body.is_in_group("Rocket"):
		hp = 0

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$Out_of_range_timer.start()

func _on_Out_of_range_timer_timeout():
	follow_player = false


func _on_DamageBox_area_entered(area):
	if area.is_in_group("Explosion"):
		hp = 0
