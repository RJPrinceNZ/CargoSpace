extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerStats.in_bonus_level = true
	MusicPlayer.change_music(MusicPlayer.song1)
	MusicPlayer.un_mute()

func _process(delta):
	PlayerStats.fuel = PlayerStats.fuel_max

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
