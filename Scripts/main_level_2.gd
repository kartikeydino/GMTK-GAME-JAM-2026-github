extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_3_button: Button = $"CanvasLayer/Lvl 3 button"
@onready var level_3: Node2D = $"../Level 3"
var timer_gone_2: bool = false
var timer_started: bool = false

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timer.start(10)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if timer_gone_2 == false:
		if (timer.timer.time_left <=0 && timer_started):
			if not beat_lvl_before_time:
				player.has_dash = false
				lvl_3_button.visible = true




func _on_lvl_3_button_pressed() -> void:
	timer_gone_2 = true
	timer.queue_free()
	player.is_in_lvl_1 = false
	player.is_in_lvl_2 = false
	player.is_in_lvl_3 = true
	level_3.timer.timer.start(60)
	level_3.timer_gone_2 = false
	level_3.timer_started = true
	player.global_position = Vector2(11000,200)
	queue_free()


func _on_spider_died() -> void:
	if (timer.timer.time_left >0):
		beat_lvl_before_time = true
		timer.timer.stop()
		beating_label.visible = true
		player.has_jump = true
		lvl_3_button.visible = true
