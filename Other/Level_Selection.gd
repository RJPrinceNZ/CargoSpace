extends Node

#shows if player has completed levels without taking damage
func _ready():
	MusicPlayer.change_music(MusicPlayer.song2)
	print(PlayerStats.nohit_level_1)
	if PlayerStats.nohit_level_1 == true:
		$QuestionMarkIcon1/AnimationPlayer.play("Unlocked")
	if PlayerStats.nohit_level_2 == true:
		$QuestionMarkIcon2/AnimationPlayer.play("Unlocked")
	if PlayerStats.nohit_level_3 == true:
		$QuestionMarkIcon3/AnimationPlayer.play("Unlocked")
	if PlayerStats.nohit_level_4 == true:
		$QuestionMarkIcon4/AnimationPlayer.play("Unlocked")
	if PlayerStats.nohit_level_5 == true:
		$QuestionMarkIcon5/AnimationPlayer.play("Unlocked")
	if PlayerStats.nohit_level_6 == true:
		$QuestionMarkIcon6/AnimationPlayer.play("Unlocked")

#all buttons, to either go back to title, or choose a level

func _on_Button_pressed():
	PlayerStats.set_level(1)
	get_tree().change_scene("res://Other/Levels/Level_1.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://Other/Title.tscn")

func _on_Button2_pressed():
	PlayerStats.set_level(2)
	get_tree().change_scene("res://Other/Levels/Level_2.tscn")

func _on_Button3_pressed():
	PlayerStats.set_level(3)
	get_tree().change_scene("res://Other/Levels/Level_3.tscn")

func _on_Button4_pressed():
	PlayerStats.set_level(4)
	get_tree().change_scene("res://Other/Levels/Level_4.tscn")

func _on_Button5_pressed():
	PlayerStats.set_level(5)
	get_tree().change_scene("res://Other/Levels/Level_5.tscn")

func _on_Button6_pressed():
	PlayerStats.set_level(6)
	get_tree().change_scene("res://Other/Levels/Level_6.tscn")
