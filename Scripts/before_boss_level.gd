extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var timer: Node2D = $Timer


func _on_area_2d_body_entered(body: Node2D) -> void:
	player.global_position = Vector2(11000,200)
	
	queue_free()
