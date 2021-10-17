extends StaticBody2D
#explosion when rocket blows up


func _ready():
	add_to_group("ignore")
	pass

func _process(delta):
	$AnimationPlayer.play("Explosion")
	yield($AnimationPlayer,"animation_finished")
	queue_free()

