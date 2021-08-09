extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	get_tree().quit()


func _on_Button3_pressed():
	get_tree().change_scene("res://Other/How_to_Play.tscn")


func _on_Button4_pressed():
	get_tree().change_scene("res://Other/Settings.tscn")
