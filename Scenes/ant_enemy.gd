extends Area2D



func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("kill")):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.get_tree().reload_current_scene()
