extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var h_slider: HSlider = $HSlider
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		visible = true
		get_tree().paused = true
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("BG music"), h_slider.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("VFX"), h_slider.value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), h_slider.value)


func _on_mute_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BG music"), true)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("VFX"), true)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	if toggled_on == false:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BG music"), false)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("VFX"), false)
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)


func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_blob_pressed() -> void:
	audio_stream_player.play()
