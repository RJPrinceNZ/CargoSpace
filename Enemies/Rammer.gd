extends KinematicBody2D

onready var explosion = preload("res://Enemies/Explosion.tscn")
var player
var follow_player = false
var movespeed = 50
var hp = 25
var movement = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if hp <= 0:
		SoundPlayer.play("res://Sound/mixkit-fast-game-explosion-1688.wav")
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		queue_free()
	if follow_player == true:
		$AnimationPlayer.play("Moving")
		look_at(player.position)
		#var player_loc = get_angle_to(player.global_transform.origin)
		#rotation += player_loc
		#var pos = player.global_transform.origin
		#print(player.global_transform.origin)
		var velocity = position.direction_to(player.position) * movespeed
		move_and_slide(velocity, Vector2.UP)
	else:
		$AnimationPlayer.play("Idle")
		
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$RayCast2D.set_enabled(true)
		follow_player = true
		player = body
		print("found player")


func _on_DamageBox_body_entered(body):
	print(hp)
	if body.is_in_group("Bullet"):
		hp += -20
	if body.name == "Player":
		hp = 0
	if body.is_in_group("Rocket"):
		hp = 0


func _on_DamageBox_area_entered(area):
	if area.is_in_group("Explosion"):
		hp = 0
