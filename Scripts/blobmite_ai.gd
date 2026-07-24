extends RigidBody2D

var ant_enemy: Area2D
var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ant_enemy = get_node("Ant Enemy")
	apply_impulse((ant_enemy.global_position  - Vector2(20,0)).normalized() * speed)
	if ant_enemy.global_position.x < global_position.x:
			scale.x = 1
	else:
		scale.x = -1
