extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var song1 = preload("res://Sound/mixkit-space-game-668.mp3")
onready var song2 = preload("res://Sound/mixkit-sci-fi-game-395.mp3")
var current_song = song1
# Called when the node enters the scene tree for the first time.
func _ready():
	change_music(song2)


func mute():
	pass
func un_mute():
	pass
	
func change_volume(value):
	pass	

func change_music(song):
	print(current_song)
	print(song)
	if current_song == song:
		pass
	else:
		current_song = song
		print("playing",song)
		set_stream(song)
		play()
