extends Node2D

@onready var timer: Node2D = $CanvasLayer/Timer
@onready var player: CharacterBody2D = $"../Player"
@onready var losing_label: Label = $"CanvasLayer/Losing the game label"
@onready var beating_label: Label = $"CanvasLayer/Beating the game label"
@onready var lvl_3_button: Button = $"CanvasLayer/Lvl 3 button"
var timer_gone_2: bool = false
var timer_started: bool = false

var beat_lvl_before_time: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass


func _on_finish_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/blob_level_1.tscn")


func _on_finish_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start_screen.tscn")
