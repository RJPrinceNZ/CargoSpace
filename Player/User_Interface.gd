extends CanvasLayer

#the UI oshown when playing the game.

onready var quit = preload("res://Other/quit_option.tscn")
onready var reset = preload("res://Other/reset_option.tscn")
onready var nope = preload("res://Other/Nope.tscn")

var can_quit = true
var mouse_location

func _ready():
	$Health_Bar.max_value = PlayerStats.health_max
	$Fuel_Bar.max_value = PlayerStats.fuel_max
	
#code that updates every bar
func _process(delta):
	mouse_location = get_viewport().get_mouse_position()
	if mouse_location.y < 30 and mouse_location.x > 305:
		PlayerStats.option_hover = true
	else: 
		PlayerStats.option_hover = false
	$Health_Bar.value = PlayerStats.get_health()
	$Fuel_Bar.value = PlayerStats.get_fuel()
	$Cooldown_Bar.value = PlayerStats.fire_heat
	if PlayerStats.has_rocket == 1:
		$AnimationPlayer.play("Yes_Rocket")
	else:
		$AnimationPlayer.play("No_Rocket")
	

func _on_TextureButton_pressed():
	var new_menu_reset = reset.instance()
	if PlayerStats.in_bonus_level == false:
		get_parent().add_child(new_menu_reset)
	else:
		new_menu_reset = nope.instance()
		get_parent().add_child(new_menu_reset)

func _on_TextureButton2_pressed():
	var new_menu_quit = quit.instance()
	if PlayerStats.in_bonus_level == false:
		get_parent().add_child(new_menu_quit)
	else:
		new_menu_quit = nope.instance()
		get_parent().add_child(new_menu_quit)
