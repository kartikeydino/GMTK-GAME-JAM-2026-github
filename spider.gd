extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.has_node("CharacterBody2D"):
		body.global_position = Vector2(-5.0, -394.0)



func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_node("CharacterBody2D"):
		queue_free()
