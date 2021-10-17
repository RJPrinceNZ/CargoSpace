extends RigidBody2D
#bullet summoned from cluster bomb

var is_fire = false



export var bullet_speed = 200
var is_fired = true


func _physics_process(delta):
	apply_central_impulse(Vector2(cos(rotation),sin(rotation))*bullet_speed*delta)

func _ready():
	SoundPlayer.play(SoundPlayer.shoot1)
	add_to_group("ignore")


func _on_Area2D_body_entered(body):
	print(body.name)
	if body.is_in_group("Bomb") or body.is_in_group("Explosion") or body == self:
		return
#	if body.is_in_group("wall") and not self or body.is_in_group("Cluster_bullet") and not self:
#		queue_free()
#	if not body.is_in_group("Bomb") and not body.is_in_group("Explosion") and not self:
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
