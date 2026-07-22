extends CharacterBody2D

#Variables 
@export var speed = 300.0 
@export var jump_height = -400.0 
@export var gravity = 1.3 
@export var dash_count = 1 
@export var dash_speed = 1200.0 
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	if not area_2d.has_overlapping_areas():
		velocity += get_gravity() * delta * gravity
	movement()
	move_and_slide()

func movement():
	if Input.is_action_just_pressed("up") and area_2d.has_overlapping_areas():
		velocity.y = jump_height 
	var direction := Input.get_axis("left", "right")
	if direction: 
		velocity.x = direction * speed 
	else:
		velocity.x = 0 
	if Input.is_action_just_pressed("dash"): 
		timer.start()
		speed = dash_speed 
		velocity.x = direction * speed 
	else:
		speed = 300.0 
		velocity.x = direction * speed 

func _on_timer_timeout() -> void:
	speed = 300.0 
