extends StaticBody2D

var hp = 100 #health points
var a = 1
onready var explosion = preload("res://Enemies/Explosion.tscn")

#randomizes rotation
func _ready():
	randomize()
	a = rand_range(1,-1)

func _process(delta):
	rotation += a*delta # Rotation
	if hp <= 0:
		a = 0
		var new_explosion = explosion.instance()
		get_parent().add_child(new_explosion)
		new_explosion.global_position = global_position
		SoundPlayer.play(SoundPlayer.explosion1)
		queue_free()
	else:
		$AnimationPlayer.play("Idle")


func _on_Area2D_body_entered(body): #If it is hit by something
	if body.is_in_group("Bullet"):
		hp += -20
	if body.name == "Player":
		hp += -50
	if body.is_in_group("Rocket"):
		hp = 0


#if hit by rocket explosion
func _on_Area2D_area_entered(area):
	if area.is_in_group("Explosion"):
		hp = 0
