extends Area2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D
@onready var collision_shap: CollisionShape2D = $Area2D/CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.global_position = Vector2(-5.0, -394.0)


func _on_spider_webs_cut() -> void:
	collision_shap.disabled = false
	anim_player.play("fall")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("kill"):
		queue_free()
