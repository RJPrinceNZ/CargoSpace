extends RigidBody2D

export var bullet_speed = 4000

func _ready():
	pass

func _physics_process(delta):
	add_central_force(get_global_transform().y * -bullet_speed * delta)
