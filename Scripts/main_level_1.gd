extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_2_button: Button = $"CanvasLayer/Lvl 2 button"
@onready var jump_enemy_death: AudioStreamPlayer = $AudioStreamPlayer
@onready var jump_enemy: Area2D = $jump_enemy
@onready var main_level_2: Node2D = $"../Main_Level_2"

var timer_gone: bool
var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timer.start(10)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if timer_gone == false:
		if (timer.timer.time_left <=0):
			if not beat_lvl_before_time:
				player.has_jump = false
				losing_label.visible = true
				lvl_2_button.visible = true


func _on_jump_enemy_died() -> void:
	jump_enemy_death.play()
	if (timer.timer.time_left >0):
		beat_lvl_before_time = true
		timer.timer.stop()
		beating_label.visible = true
		player.has_jump = true
		lvl_2_button.visible = true

func _on_lvl_2_button_pressed() -> void:
	timer_gone = true
	timer.queue_free()
	main_level_2.timer.timer.start(20)
	player.is_in_lvl_1 = false
	player.is_in_lvl_2 = true
	main_level_2.timer_gone_2 = false
	main_level_2.timer_started = true
	player.global_position = Vector2(6250,1300)
	queue_free()
