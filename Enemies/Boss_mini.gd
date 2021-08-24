extends KinematicBody2D

onready var explosion = preload("res://Enemies/Explosion.tscn")
onready var bullet = preload("res://Enemies/Boss_Bullet.tscn")
var hp = 50
var found_player
var player
var can_fire = true
var Summoning = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Summon")
	Summoning = true
	$Summon_timer.start()

func _physics_process(delta):
	if Summoning == true:
		pass
	else:
		$AnimationPlayer.play("Idle")
		if hp <= 0:
			can_fire = false
			SoundPlayer.play(SoundPlayer.explosion1)
			var new_explosion = explosion.instance()
			get_parent().add_child(new_explosion)
			new_explosion.global_position = global_position
			queue_free()
		if found_player == true:
			look_at(player.position)
			if can_fire == true:
				can_fire = false
				$Timer.start()
				var new_bullet1 = bullet.instance()
				new_bullet1.global_transform = $Position2D.global_transform
				get_parent().add_child(new_bullet1)



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		found_player = true
		player = body


func _on_Hitbox_body_entered(body):
	if body.is_in_group("Bullet"):
		hp += -20


func _on_Timer_timeout():
	can_fire = true


func _on_Summon_timer_timeout():
	Summoning = false
