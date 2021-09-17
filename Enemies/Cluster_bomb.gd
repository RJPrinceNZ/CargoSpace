extends RigidBody2D


onready var bullet = preload("res://Enemies/Cluster_bullet.tscn")
onready var explosion = preload("res://Enemies/Explosion.tscn")
var bomb_speed = 700
var bullet_speed = 175
# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello")
	$Timer.start()

func _physics_process(delta):
		add_central_force(get_global_transform().x * bomb_speed * delta)

func _on_Timer_timeout():
	pass # Replace with function body.
	var new_bullet1 = bullet.instance()
	new_bullet1.global_transform = $Cluster_point1.global_transform
	new_bullet1.apply_impulse(Vector2(), Vector2(bullet_speed,0))
	get_parent().add_child(new_bullet1)
	var new_bullet2 = bullet.instance()
	new_bullet2.global_transform = $Cluster_point2.global_transform
	new_bullet2.apply_impulse(Vector2(), Vector2(0,bullet_speed))
	get_parent().add_child(new_bullet2)
	var new_bullet3 = bullet.instance()
	new_bullet3.global_transform = $Cluster_point3.global_transform
	get_parent().add_child(new_bullet3)
	new_bullet3.apply_impulse(Vector2(), Vector2(-bullet_speed,0))
	var new_bullet4 = bullet.instance()
	new_bullet4.global_transform = $Cluster_point4.global_transform
	new_bullet4.apply_impulse(Vector2(), Vector2(0,-bullet_speed))
	get_parent().add_child(new_bullet4)
	var new_bullet5 = bullet.instance()
	new_bullet5.global_transform = $Cluster_point5.global_transform
	new_bullet5.apply_impulse(Vector2(), Vector2(((2^1/2)-1.2)*bullet_speed,-((2^1/2)-1.2)*bullet_speed))
	get_parent().add_child(new_bullet5)
	var new_bullet6 = bullet.instance()
	new_bullet6.global_transform = $Cluster_point6.global_transform
	new_bullet6.apply_impulse(Vector2(), Vector2(((2^1/2)-1.2)*bullet_speed,((2^1/2)-1.2)*bullet_speed))
	get_parent().add_child(new_bullet6)
	var new_bullet7 = bullet.instance()
	new_bullet7.global_transform = $Cluster_point7.global_transform
	new_bullet7.apply_impulse(Vector2(), Vector2(-((2^1/2)-1.2)*bullet_speed,((2^1/2)-1.2)*bullet_speed))
	get_parent().add_child(new_bullet7)
	var new_bullet8 = bullet.instance()
	new_bullet8.global_transform = $Cluster_point8.global_transform
	new_bullet8.apply_impulse(Vector2(), Vector2(-((2^1/2)-1.2)*bullet_speed,-((2^1/2)-1.2)*bullet_speed))
	get_parent().add_child(new_bullet8)
	SoundPlayer.play(SoundPlayer.explosion1)
	var new_explosion = explosion.instance()
	get_parent().add_child(new_explosion)
	new_explosion.global_position = global_position
	queue_free()
