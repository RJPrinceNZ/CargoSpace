extends CanvasLayer

#tab that pops up when leaving level


func _ready():
	PlayerStats.option_open = true

func _on_Yes_pressed():
	PlayerStats.option_open = false
	get_tree().change_scene("res://Other/Level_Selection.tscn")
	queue_free()
	

func _on_No_pressed():
	PlayerStats.option_open = false
	queue_free()
