extends CharacterBody2D

#Abilities
@export var has_jump = true
@export var has_dash = true
@export var has_wall_climb = true 
@export var has_walk = true 
#Movement 
@export var speed = 300.0 
@export var jump = -400.0 
@export var downward_force = 1.3 
@export var dash_speed = 1000.0 
@export var dash_counter = 0 
#Connections
@onready var jump_buffer : Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_polygon_2d: CollisionShape2D = $CollisionPolygon2D


func _physics_process(delta: float) -> void:
	if not jump_buffer.has_overlapping_areas():
		velocity.y += get_gravity() * delta * downward_force
	if Input.is_action_pressed("climb") and has_wall_climb == true and is_on_wall():
		velocity.y += jump * delta
	var direction := Input.get_axis("left", "right")
	if direction and has_walk == true:
		velocity.x = direction * speed
		animated_sprite_2d.play("running")
	else:
		velocity.x = 0 
		animated_sprite_2d.play("default")
	other_movement()
	move_and_slide()
func other_movement():
	if Input.is_action_just_pressed("up") and has_jump == true and jump_buffer.has_overlapping_areas():
		velocity.y = jump
	if Input.is_action_just_pressed("dash") and has_dash == true:
		speed = dash_speed 
		dash_counter += 1 
		print(dash_counter)
		await get_tree().create_timer(0.12).timeout
		speed = 300.0 
	else: 
		speed = 300.0 
	if dash_counter == 3:
		collision_polygon_2d.disabled = true 
		animated_sprite_2d.modulate.a = 200 
		speed = (dash_speed * 2)
		await get_tree().create_timer(0.12).timeout 
		speed = 300.0 
	else:
		collision_polygon_2d.disabled = false
		animated_sprite_2d.modulate.a = 255  
		speed = 300.0
