extends Area2D

@onready var player: CharacterBody2D = $"../../../Player"

var numbers = [1, 2, 3, 4]

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var thing = numbers.pick_random()
		if thing == 1:
			player.has_dash = false
		elif thing == 2:
			player.has_wall_climb = false
		elif thing == 3: 
			player.has_jump = false 
		elif thing == 4: 
			player.has_glitch_fling = false
