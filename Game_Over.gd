extends Node

#scene shown when player loses


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")
