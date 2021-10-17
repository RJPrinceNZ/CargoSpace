extends StaticBody2D
#points wheer the player finishes the level


func _on_Area2D_body_entered(body):
	print("found")
	if body.is_in_group("player"):
		if PlayerStats.nohit == true:
			PlayerStats.nohit_completed()
		get_tree().change_scene("res://Other/Level_Finish.tscn")
