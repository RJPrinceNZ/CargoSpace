extends Node

#settings to change volume of music and sound

var Music_Volume = "100%"
var Sound_Volume = "100%"

func _ready():
	$HSlider2.value = SoundPlayer.vol
	$HSlider.value = MusicPlayer.vol
	print(MusicPlayer.current_volume,SoundPlayer.current_volume)

func _on_HSlider2_value_changed(value):
	SoundPlayer.set_volume(value)
	Sound_Volume = str(value*100,"%")
func _on_HSlider_value_changed(value):
	MusicPlayer.change_volume(value)
	Music_Volume = str(value*100,"%")
	

func _on_Button_pressed():
	get_tree().change_scene("res://Other/Title.tscn")


func _on_Button2_pressed():
	SoundPlayer.play(SoundPlayer.shoot1)

func _process(delta):
	$Label3.set_text(Music_Volume)
	$Label4.set_text(Sound_Volume)
