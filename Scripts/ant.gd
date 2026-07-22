extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var player

const SPEED = 300.0
@export var player_node: CharacterBody2D

func _physics_process(delta: float) -> void:
	global_rotation = 0.0
	var _direction = (player_node.global_position - global_position).normalized()
	velocity = _direction * SPEED
	look_at(player_node.position)
	move_and_slide()
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		velocity = _direction * SPEED
	if velocity.x > 1:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.has_method("kill"):
		pass

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player.dielabel.visible = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
