extends CanvasLayer
#appears when trying to reset or leave bonus level

func _on_Timer_timeout():
	queue_free()
