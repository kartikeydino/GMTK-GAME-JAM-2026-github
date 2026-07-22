extends Area2D
var player

func _on_body_entered(body: Node2D) -> void:
	if (body.has_method("player")):
		player = body
