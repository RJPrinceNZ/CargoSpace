extends StaticBody2D

#rocket power up that shoots a rocket


func _ready():
	pass 



func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		if PlayerStats.has_rocket == 0:
			print("hello")
			PlayerStats.change_rocket(-1)
			queue_free()
