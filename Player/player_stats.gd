extends Node

var health
var health_max
var fuel
var fuel_max

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

func get_fuel():
	return fuel

func has_fuel():
	return fuel > 0
