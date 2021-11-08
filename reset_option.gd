extends CanvasLayer

#what appears when reseting level

func _ready():
	PlayerStats.option_open = true


func _on_Yes_pressed():
	PlayerStats.option_open = false
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")
	queue_free()

func _on_No_pressed():
	PlayerStats.option_open = false
	queue_free()
