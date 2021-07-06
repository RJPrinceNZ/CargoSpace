extends StaticBody2D

var hp = 100 #health points
var a = rand_range(1,-1)

func _process(delta):
	rotation += a*delta # Rotation
	if hp <= 0:
		a = 0
		$AnimationPlayer.play("Death") #Explosion Animation
		yield($AnimationPlayer,"animation_finished")
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



func _on_Area2D_area_entered(area):
	if area.is_in_group("Explosion"):
		hp = 0
