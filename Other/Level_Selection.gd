extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
