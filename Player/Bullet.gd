extends RigidBody2D

export var bullet_speed = 12000
var is_fired = true

func _ready():
	add_to_group("ignore")
	pass

func _physics_process(delta):
	if is_fired == true:
		add_central_force(get_global_transform().y * -bullet_speed * delta)
		


func _on_Area2D_body_entered(body):
	if not body.name == "Player" and not body.is_in_group("ignore"):
		queue_free()
	pass # Replace with function body.
