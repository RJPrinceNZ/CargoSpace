extends StaticBody2D
#powerup for player that gives health


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		PlayerStats.change_health(25)
		SoundPlayer.play(SoundPlayer.powerup1)
		queue_free()
