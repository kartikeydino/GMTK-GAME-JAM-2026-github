extends Node2D
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

@export var timer_time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(timer_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Time left: %.1f" % timer.time_left
