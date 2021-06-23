extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Health_Bar.max_value = PlayerStats.health_max
	$Fuel_Bar.max_value = PlayerStats.fuel_max
func _process(delta):
	$Health_Bar.value = PlayerStats.get_health()
	$Fuel_Bar.value = PlayerStats.get_fuel()
	

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Other/Levels/Level_" +str(PlayerStats.current_level)+".tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Other/Level_Selection.tscn")
