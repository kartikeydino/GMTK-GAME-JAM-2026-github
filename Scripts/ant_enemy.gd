extends Area2D

var player
var speed = 300
@export var player_node: CharacterBody2D

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("kill")):
		var player_bounce = area.get_parent()
		player_bounce.bouncy_wouncy()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player.dielabel.visible = true
		await get_tree().create_timer(1).timeout
		player.get_tree().reload_current_scene()

func _physics_process(_delta: float) -> void:
	global_rotation = 0.0
	var direction = (player_node.global_position - global_position).normalized
	position += direction
	look_at(player_node.global_position)
