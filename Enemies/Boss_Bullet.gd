extends RigidBody2D

export var bullet_speed = 200
var is_fired = true

func _ready():
	SoundPlayer.play(SoundPlayer.shoot1)
	add_to_group("ignore")

func _physics_process(delta):
	apply_central_impulse(Vector2(cos(rotation),sin(rotation))*bullet_speed*delta)

func _on_Area2D_body_entered(body):
	if not body.is_in_group("Enemy_Bullet") and not body.is_in_group("ignore"):
		queue_free()
