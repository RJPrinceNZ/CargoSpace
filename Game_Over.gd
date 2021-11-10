extends Node

#scene shown when player loses

func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)

func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")
