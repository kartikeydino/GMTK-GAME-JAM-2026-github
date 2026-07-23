extends Node2D
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

@export var timer_time: float = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = timer_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "%1.1f" % timer.time_left
