extends Node

#scene that shows basic mechanics of the game



func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Title.tscn")
