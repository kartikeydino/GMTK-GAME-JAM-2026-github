extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var player: CharacterBody2D = $Player
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_2_button: Button = $"CanvasLayer/Lvl 2 button"
@onready var jump_enemy_death: AudioStreamPlayer = $AudioStreamPlayer

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if (timer.timer.time_left <=0):
		if not beat_lvl_before_time:
			player.can_jump = false
			losing_label.visible = true


func _on_jump_enemy_died() -> void:
	jump_enemy_death.play()
	if (timer.timer.time_left >0):
		beat_lvl_before_time = true
		timer.timer.stop()
		beating_label.visible = true
		player.has_jump = true
		lvl_2_button.visible = true
	

func _on_lvl_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
