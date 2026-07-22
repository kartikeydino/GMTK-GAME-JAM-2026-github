extends Control

const lettuce_cursor = preload("uid://cytjpyyiasv1g")
const tomato_cursor = preload("uid://bjm3ifhlufjd6")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Input.set_custom_mouse_cursor(tomato_cursor, Input.CURSOR_ARROW)


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
