extends Node

var current_text = 1
var text01 = "pathetic"
var text02 = "well then"
var text03 = "maybe you should try again"
var text04 = "after you do your insanity again"
var text11 = "huh"
var text12 = "you did better than I expected"
var text13 = "well"
var text14 = "still not good enough"
var text15 = "bet this without getting hit to get you prize"
var text21 = "Impressive"
var text22 = "you did much better than I expected"
var text23 = "Congratulations"
var text24 = "Here is your prize:"
var text25 = "..."
var text26 = "yep, that's right"
var text27 = "it's nothing"
var can_press = false

func _ready():
	MusicPlayer.mute()
	can_press = false
	$Timer.start()


func _process(delta):
	if PlayerStats.nohit == true:
		if current_text == 1:
			$Label.set_text(text21)
		if current_text == 2:
			$Label.set_text(text22)
		if current_text == 3:
			$Label.set_text(text23)
		if current_text == 4:
			$Label.set_text(text24)
		if current_text == 5:
			$Label.set_text(text25)
		if current_text == 6:
			$Label.set_text(text26)
		if current_text == 7:
			$Label.set_text(text27)
		if current_text >= 8:
			get_tree().quit()
	elif not PlayerStats.died == false:
		if current_text == 1:
			$Label.set_text(text11)
		if current_text == 2:
			$Label.set_text(text12)
		if current_text == 3:
			$Label.set_text(text13)
		if current_text == 4:
			$Label.set_text(text14)
		if current_text == 5:
			$Label.set_text(text15)
		if current_text >= 6:
			get_tree().quit()
	else:
		if current_text == 1:
			$Label.set_text(text01)
		if current_text == 2:
			$Label.set_text(text02)
		if current_text == 3:
			$Label.set_text(text03)
		if current_text == 4:
			$Label.set_text(text04)
		if current_text >= 5:
			get_tree().quit()




func _on_Next_pressed():
	can_press = false
	current_text += 1
	$AnimationPlayer.play("Hidden")
	$Timer.start()


func _on_Timer_timeout():
	can_press = true
	$AnimationPlayer.play("Shown")
