extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"d


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	print("found")
	if body.is_in_group("player"):
		get_tree().change_scene("res://Other/Level_Finish.tscn")
