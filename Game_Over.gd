extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.change_song(MusicPlayer.song2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")
