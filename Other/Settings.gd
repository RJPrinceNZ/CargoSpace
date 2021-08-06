extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HSlider2.value = SoundPlayer.current_volume


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider2_value_changed(value):
	SoundPlayer.set_volume(value)

func _on_HSlider_value_changed(value):
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Title.tscn")


func _on_Button2_pressed():
	SoundPlayer.play("res://Sound/mixkit-short-laser-gun-shot-1670.wav")
