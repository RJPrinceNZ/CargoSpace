extends CanvasLayer

#tab that pops up when leaving level


func _ready():
	pass

func _on_Yes_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")
	queue_free()

func _on_No_pressed():
	queue_free()
