extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_3_button: Button = $"CanvasLayer/Lvl 3 button"
var timer_gone_2: bool = false

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if timer_gone_2 == false:
		if (timer.timer.time_left <=0):
			if not beat_lvl_before_time:
				player.has_dash = false
				losing_label.visible = true





func _on_lvl_3_button_pressed() -> void:
	timer.queue_free()
	player.global_position = Vector2(11300,200)
