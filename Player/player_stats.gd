extends Node

var health
var health_max
var fuel
var fuel_max
var current_level = 1
var level_count = 5

func _ready():
	health = 100
	health_max = 100
	fuel = 100
	fuel_max = 100

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
