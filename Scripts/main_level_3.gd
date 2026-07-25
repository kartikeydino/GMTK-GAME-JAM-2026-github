extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
var timer_gone_2: bool = false
var timer_started: bool = false
@onready var extra_blobl_level: Button = $"CanvasLayer/Extra blobl level"
@onready var finish_button_2: Button = $"CanvasLayer/Finish Button2"
@onready var main_level_2: Node2D = $"../Main_Level_2"

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if timer.timer.time_left < 0:
		finish_button_2.visble = true
		losing_label.visible = false


func _on_finish_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/blob_level_1.tscn")


func _on_finish_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")


func _on_boss_died() -> void:
	if timer.time_left < 0:
		losing_label.visible = false
		finish_button_2.visble = true
		extra_blobl_level.visible = true
		beating_label.visible = true
		timer.timer.stop()
