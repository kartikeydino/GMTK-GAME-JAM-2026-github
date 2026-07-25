extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var level_3: Node2D = $"../Level 3"
var timer_gone_2: bool = false
var timer_started: bool = false
var beat_lvl_before_time: bool = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	timer_gone_2 = true
	player.is_in_lvl_1 = false
	player.is_in_lvl_2 = false
	player.is_in_lvl_3 = true
	level_3.timer.timer.start(60)
	level_3.timer_gone_2 = false
	level_3.timer_started = true
	player.global_position = Vector2(11000,200)
	queue_free()
