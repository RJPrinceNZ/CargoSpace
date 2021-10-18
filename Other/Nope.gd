extends CanvasLayer
#appears when trying to reset or leave bonus level

func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
