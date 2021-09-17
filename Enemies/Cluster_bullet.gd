extends RigidBody2D


var is_fire = false


# Called when the node enters the scene tree for the first time.
export var bullet_speed = 12000
var is_fired = true


# Called when the node enters the scene tree for the first time.
func _ready():
	SoundPlayer.play(SoundPlayer.shoot1)
	add_to_group("ignore")


func _on_Area2D_body_entered(body):
	if not body.is_in_group("Enemy_Bullet") and not body.is_in_group("ignore"):
		queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
