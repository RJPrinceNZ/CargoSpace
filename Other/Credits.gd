extends Node
#credit menu links


func _on_LinkButton_pressed():
	
	OS.shell_open("https://craftpix.net/product/asteroids-crusher-2d-game-kit/")

func _on_LinkButton2_pressed():
	OS.shell_open("https://mixkit.co/free-sound-effects/space-shooter/")

func _on_LinkButton3_pressed():
	OS.shell_open("https://www.dafont.com/arkitech.font")


func _on_Button_pressed():
	get_tree().change_scene("res://Other/Title.tscn")


func _on_LinkButton4_pressed():
	OS.shell_open("https://www.youtube.com/channel/UC_c8-ABAqDEemidFQxz9K6Q")
