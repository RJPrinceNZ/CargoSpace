extends Node

#title screen of game

func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)



func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	get_tree().quit()


func _on_Button3_pressed():
	get_tree().change_scene("res://Other/How_to_Play.tscn")


func _on_Button4_pressed():
	get_tree().change_scene("res://Other/Settings.tscn")


func _on_Button5_pressed():
	get_tree().change_scene("res://Other/Credits.tscn")
