extends Node
#thing that plays sound effects

onready var shoot1 = preload("res://Sound/mixkit-short-laser-gun-shot-1670.wav")
onready var explosion1 = preload("res://Sound/mixkit-fast-game-explosion-1688.wav")
onready var launch1 = preload("res://Sound/mixkit-short-impact-static-3131.wav")
var current_volume = 1
var vol = 1
func play(sound):
	var audio_stream = AudioStreamPlayer.new()
	audio_stream.volume_db = current_volume#current_volume
	self.add_child(audio_stream)
	audio_stream.stream = sound
	audio_stream.play()
	yield(audio_stream,"finished")
	audio_stream.queue_free()
	
	
func set_volume(volume):
	current_volume= linear2db(volume)
	vol = volume
	
