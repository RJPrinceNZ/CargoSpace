extends StaticBody2D

var hp = 100 #health points

func _process(delta):
	rotation += 1*delta # Rotation
	if hp <= 0:
		$AnimationPlayer.play("Death") #Explosion Animation
		yield($AnimationPlayer,"animation_finished")
		queue_free()
	else:
		$AnimationPlayer.play("Idle")


func _on_Area2D_body_entered(body): #If it is hit by something
	if body.name == "Bullet":
		hp += -20
	if body.name == "Player":
		hp += -50
