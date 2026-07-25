extends Area2D
var player

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player = body
		player.animated_sprite_2d.play("running")
		player.set_physics_process(false)
		await get_tree().create_timer(0.5).timeout
		player.speed = player.normal_speed * 10
		player.set_physics_process(true)
		player.velocity.y -= 1500
		player.collision_shape.disabled = true
		print(player.velocity.x)
		print(player.velocity.y)
		await get_tree().create_timer(0.2).timeout
		player.speed =  player.normal_speed
		player.collision_shape.disabled = false
		player.self_modulate.a = 200  
		player.position.y += -20
