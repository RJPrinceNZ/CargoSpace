extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var song1 = preload("res://Sound/mixkit-space-game-668.mp3")
onready var song2 = preload("res://Sound/mixkit-sci-fi-game-395.mp3")
var current_song = song1
var current_volume = 1
var vol=1
# Called when the node enters the scene tree for the first time.
func _ready():
	change_music(song2)

func mute():
	set_volume_db(linear2db(0))
func un_mute():
	set_volume_db(current_volume)
	
func change_volume(value):
	vol = value
	current_volume = linear2db(value)
	set_volume_db(current_volume)
	
func change_music(song):
	print(current_song)
	print(song)
	if current_song == song:
		pass
	else:
		current_song = song
		print("playing",song)
		set_volume_db(current_volume)
		set_stream(song)
		play()
