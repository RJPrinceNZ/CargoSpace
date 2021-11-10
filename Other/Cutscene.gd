extends Node
#cutscene played before fighting boss

var can_press = false
var current_text = 1
var text1 = "..."
var text2 = "hmmm"
var text3 = "Well hello there"
var text4 = "I didn't expect this"
var text5 = "I suprised you thought of doing and did every level without taking damage"
var text6 = "Impressive"
var text7 = "Well then"
var text8 = "Let's test out your skills shall we?"

#stops music
func _ready():
	MusicPlayer.mute()
	$Label.set_text(text1)
	can_press = false
	$Timer.start()
	
func _process(delta):
	if current_text == 9:
		get_tree().change_scene("res://Other/Levels/Level_Bonus.tscn")
	else:
		if current_text == 1:
			$Label.set_text(text1)
		if current_text == 2:
			$Label.set_text(text2)
		if current_text == 3:
			$Label.set_text(text3)
		if current_text == 4:
			$Label.set_text(text4)
		if current_text == 5:
			$Label.set_text(text5)
		if current_text == 6:
			$Label.set_text(text6)
		if current_text == 7:
			$Label.set_text(text7)
		if current_text == 8:
			$Label.set_text(text8)

func _on_Next_pressed():
	can_press = false
	$AnimationPlayer.play("Hidden")
	current_text += 1
	$Timer.start()


func _on_Timer_timeout():
	can_press = true
	$AnimationPlayer.play("Shown")
