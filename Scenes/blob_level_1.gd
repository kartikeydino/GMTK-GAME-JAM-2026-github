extends Node2D
@onready var timer: Node2D = $CanvasLayer/Timer
@onready var ant: Area2D = $"Ant Enemy"
@onready var player: CharacterBody2D = $Player
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if (timer.timer.time_left <=0):
		if(beat_lvl_before_time):
			player.can_jump = true
			beating_label.visible = true
			get_tree().paused = true
		else:
			player.can_jump = false
			losing_label.visible = true
			get_tree().paused = true
		

func _on_ant_enemy_died() -> void:
	if (timer.timer.time_left >0):
		beat_lvl_before_time = true
		print(str(timer.timer.time_left))
		player.can_jump = true
