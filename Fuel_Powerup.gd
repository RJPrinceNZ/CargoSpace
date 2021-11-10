extends StaticBody2D
#A powerup that gives the player more time (aka fuel)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		if not PlayerStats.get_fuel() >= 100:
			PlayerStats.change_fuel(15)
			SoundPlayer.play(SoundPlayer.powerup1)
			queue_free()
