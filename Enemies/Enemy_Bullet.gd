extends RigidBody2D
#bullet fired from shooter enemy

export var bullet_speed = 12000
var is_fired = true


func _ready():
	SoundPlayer.play(SoundPlayer.shoot1)
	add_to_group("ignore")

func _physics_process(delta):
	if is_fired == true:
		add_central_force(get_global_transform().x * bullet_speed * delta)
		is_fired = false

func _on_Area2D_body_entered(body):
	if not body.is_in_group("Enemy_Bullet") and not body.is_in_group("ignore") and not body.is_in_group("Boss"):
		queue_free()
