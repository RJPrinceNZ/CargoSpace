extends RigidBody2D

#code for the rocket from the rocket powerup


onready var explosion = preload("res://Player/Explosion.tscn")
export var bullet_speed = 25000
var is_fired = false


func _ready():
	SoundPlayer.play(SoundPlayer.launch1)
	add_to_group("ignore")
	pass

func _process(delta):
	$AnimationPlayer.play("Traveling")
	if is_fired == false:
		is_fired = true
		PlayerStats.set_rocket(0)
		add_central_force(get_global_transform().y * -bullet_speed * delta)


func _on_Hit_Box_body_entered(body):
	if not body.name == "Player" and not body.is_in_group("ignore"):
		var new_explosion = explosion.instance()
		SoundPlayer.play(SoundPlayer.explosion1)
		new_explosion.global_transform = $Position2D.global_transform
		get_parent().add_child(new_explosion)
		queue_free()
	pass 
