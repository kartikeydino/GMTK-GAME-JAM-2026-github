extends Node2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var death_counter = 0 
const goal_1 = 1 
const goal_2 = 5 
const goal_3 = 10 
const goal_4 = 15 
const goal_5 = 20 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	lose_time()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	death_counter += 1 
	

func lose_time():
	if death_counter >= goal_1 and death_counter < goal_2:
		animation_player.play("lose time")
		
	elif death_counter >= goal_2 and death_counter > goal_1:
		animation_player.play("lose_time_2")
