extends Node

#level where boss is



func _ready():
	PlayerStats.in_bonus_level = true
	MusicPlayer.change_music(MusicPlayer.song3)
	MusicPlayer.un_mute()

func _process(delta):
	PlayerStats.fuel = PlayerStats.fuel_max

