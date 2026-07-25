extends Node2D

@export var timer: Node2D 
@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_3_button: Button = $"CanvasLayer/Lvl 3 button"
@onready var jump_enemy_death: AudioStreamPlayer = $AudioStreamPlayer

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timer.start(20)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if (timer.timer.time_left <=0):
		if not beat_lvl_before_time:
			player.has_dash = false
			losing_label.visible = true


func _on_jump_enemy_died() -> void:
	jump_enemy_death.play()
	if (timer.timer.time_left >0):
		beat_lvl_before_time = true
		timer.timer.stop()
		beating_label.visible = true
		player.has_dash = true
		lvl_3_button.visible = true


func _on_lvl_3_button_pressed() -> void:
	player.global_position = Vector2(11300,200)
