extends CanvasLayer

#what appears when reseting level

func _ready():
	pass 


func _on_Yes_pressed():
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")
	queue_free()

func _on_No_pressed():
	queue_free()
