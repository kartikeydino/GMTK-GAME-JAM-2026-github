extends Control

var audio_bus = AudioServer.get_bus_index("BG music")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		visible = true
		get_tree().paused = true
	


func _on_mute_toggled(toggled_on: bool) -> void:
	pass


func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_blob_pressed() -> void:
	pass # Replace with function body.
