extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Yes_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")
	queue_free()

func _on_No_pressed():
	queue_free()
