extends Area2D
signal died
var player
var speed = 5.5
@export var player_node: CharacterBody2D
@export var permanent_y_value: int
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast: RayCast2D = $RayCast2D

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if(area.has_method("kill")):
		var player_bounce = area.get_parent()
		player_bounce.bouncy_wouncy()
		died.emit()
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player.deadtp()
		await get_tree().create_timer(2).timeout
		player.starttp()

func _physics_process(_delta: float) -> void:
	global_position.y = permanent_y_value
	if not ray_cast.is_colliding():
		global_position += (player_node.global_position - global_position - Vector2(20,0)).normalized() * speed
		if player_node.global_position.x < global_position.x:
			scale.x = 1
		else:
			scale.x = -1
