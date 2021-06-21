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
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
