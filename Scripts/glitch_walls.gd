extends Area2D
var player

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player = body
		player.animated_sprite_2d.play("running")
		player.set_physics_process(false)
		await get_tree().create_timer(0.5).timeout
		player.speed = player.normal_speed * 10
		player.collision_shape.disabled = true 
		player.set_physics_process(true)
		await get_tree().create_timer(0.2).timeout
		player.speed =  player.normal_speed
		player.collision_shape.disabled = false 
