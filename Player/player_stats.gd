extends Node

var health
var health_max
var fuel
var fuel_max
var current_level = 1
var level_count = 6
var has_rocket = 0
var fire_heat = 0
var cooldown = false
var nohit_level_1 = false
var nohit_level_2 = false
var nohit_level_3 = false
var nohit_level_4 = false
var nohit_level_5 = false
var nohit_level_6 = false
var nohit = true
func _ready():
	fire_heat = 0
	health = 100
	health_max = 100
	fuel = 100
	fuel_max = 100
	cooldown = false

func nohit_completed():
	if current_level == 1:
		nohit_level_1 = true
	if current_level == 2:
		nohit_level_2 = true
	if current_level == 3:
		nohit_level_3 = true
	if current_level == 4:
		nohit_level_4 = true
	if current_level == 5:
		nohit_level_5 = true
	if current_level == 6:
		nohit_level_6 = true
	if nohit_level_1 == true and nohit_level_2 == true and nohit_level_3 == true and nohit_level_4 == true and nohit_level_5 == true and nohit_level_6 == true:
		pass
func change_health(amount):
	health += amount
	health = clamp(health,0,health_max)

func change_fuel(amount):
	fuel += amount
	fuel = clamp(fuel,0,fuel_max)

func get_health():
	return health

func reset():
	health = health_max
	fuel = fuel_max

func get_fuel():
	return fuel

func set_level(amount):
	current_level = amount

func change_level():
	current_level += 1
	if current_level <= level_count:
		get_tree().change_scene("res://Other/Levels/Level_" +str(current_level)+".tscn")

func has_fuel():
	return fuel > 0

func change_rocket(amount):
	has_rocket += 1
	has_rocket = clamp(has_rocket,0,1)
	
func set_rocket(amount):
	has_rocket = amount
	has_rocket = clamp(has_rocket,0,1)
