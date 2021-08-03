extends Node

var current_volume = 1

func play(sound):
	var audio_stream = AudioStreamPlayer.new()
	audio_stream.volume_db = current_volume#current_volume
	self.add_child(audio_stream)
	audio_stream.stream = load(sound)
	audio_stream.play()
	
func set_volume(volume):
	current_volume= linear2db(volume)
	
