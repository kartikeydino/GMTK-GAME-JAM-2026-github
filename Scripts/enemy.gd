extends Area2D
signal died
var player
var speed = 6
@export var player_node: CharacterBody2D
@export var permanent_y_value: int
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox_collision: CollisionShape2D = $Hurtbox/CollisionShape2D
@onready var collision: CollisionShape2D = $CollisionShape2D

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("kill")):
		var player_bounce = area.get_parent()
		player_bounce.bouncy_wouncy()
		died.emit()
		hurtbox_collision.call_deferred("is_disabled")
		collision.call_deferred("is_disabled")
		var tween = create_tween()
		tween.tween_property(anim, "scale", Vector2(1, -1), 0.3)
		tween.parallel().tween_property(anim, "global_position", Vector2(global_position.x, global_position.y + 70), 0.3)
		speed = 0
		await get_tree().create_timer(1.03).timeout
		queue_free()
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player.deadtp()
		await get_tree().create_timer(2).timeout
		player.starttp()

func _physics_process(_delta: float) -> void:
	global_position.y = permanent_y_value
	global_position += (player_node.global_position - global_position - Vector2(20,0)).normalized() * speed
	if player_node.global_position.x < global_position.x:
		scale.x = 1
	else:
		scale.x = -1
