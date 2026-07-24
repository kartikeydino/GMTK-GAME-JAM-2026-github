extends Area2D

var ant_enemy: Area2D
@export var speed: int = 1
var tween = create_tween()

func _process(_delta: float) -> void:
	tween.tween_property(self, "global_position", Vector2(ant_enemy.global_position), speed)
