extends Control
@onready var main_start_screen: Control = $Main_Start_Screen
@onready var tutorial_node: Control = $Tutorial_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/blob_level_1.tscn")



func _on_tutorial_pressed() -> void:
	main_start_screen.visible = false
	tutorial_node.visible = true


func _on_back_pressed() -> void:
	main_start_screen.visible = true
	tutorial_node.visible = false


func _on_play_button_main_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
