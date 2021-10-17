extends Node

#scene that appears when level complete

func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")


func _on_Button2_pressed():
	PlayerStats.change_level()
