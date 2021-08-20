extends KinematicBody2D

var hp = 15000
onready var explosion = preload("res://Enemies/Explosion_big.tscn")
var found_player = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 15000
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.max_value = hp
	$CanvasLayer/ProgressBar.set_value(hp)

func _process(delta):
	print(hp)
	if found_player == true:
		pass
	$CanvasLayer/Boss_Hp_Bar.set_text(str(hp))
	$CanvasLayer/ProgressBar.set_value(hp)
	if hp <= 0:
		SoundPlayer.play(SoundPlayer.explosion1)
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		queue_free()


func _on_HitBox_body_entered(body):
	if body.is_in_group("Bullet"):
		hp += -20


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		found_player = true
