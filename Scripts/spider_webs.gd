extends Area2D

@export var spider: Area2D
var player
signal cut
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player = body
		if player.dashing:
			cut.emit()
			queue_free()
