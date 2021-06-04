extends KinematicBody2D


onready var bullet = preload("res://Enemy_Bullet.tscn")
var player
var follow_player = false
var movespeed = 50
var hp = 150
var movement = Vector2.ZERO
var can_fire = true

func _physics_process(delta):
	if hp <= 0:
		pass
	if follow_player == true:
		look_at(player.position)
		if can_fire == true:
			can_fire = false
			var new_bullet = bullet.instance()
			new_bullet.global_transform = $Position2D.global_transform
			get_parent().add_child(new_bullet)
			$Shooter_Timer.start()
	
	
func _ready():
	pass



func _on_Shooter_Timer_timeout():
	can_fire = true


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		follow_player = true
		player = body
		print("found player")
