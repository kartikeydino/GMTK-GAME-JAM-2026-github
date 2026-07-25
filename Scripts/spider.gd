extends Area2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var area_2d: Area2D = $Area2D
@onready var collision_shap: CollisionShape2D = $Area2D/CollisionShape2D
signal died
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.deadtp()


func _on_spider_webs_cut() -> void:
	collision_shap.set_deferred("disabled", false)
	anim_player.play("fall")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("kill"):
		died.emit()
		queue_free()
