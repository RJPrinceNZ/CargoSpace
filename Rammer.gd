extends KinematicBody2D


var player
var follow_player = false
var movespeed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if follow_player == true:
		var player_loc = get_angle_to(player.global_transform.origin)
		rotation += player_loc
		
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$RayCast2D.set_enabled(true)
		follow_player = true
		player = body
		print("found player")
