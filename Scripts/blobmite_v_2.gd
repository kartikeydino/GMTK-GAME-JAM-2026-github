#extends CharacterBody2D


#const SPEED = 10
#const JUMP_VELOCITY = -400.0

#@onready var ant_enemy = get_node("Ant Enemy")
#var dir = (ant_enemy.global_position - global_position).normalized

#func _physics_process(delta: float) -> void:
#	global_position += dir
#func _ready() -> void:
#	pass
