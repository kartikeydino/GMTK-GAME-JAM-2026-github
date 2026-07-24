extends CharacterBody2D

var dying = false
#Abilities
@export var has_jump: bool = true
@export var has_dash: bool = true
@export var has_wall_climb: bool = true 
@export var has_walk: bool = true 
#Movement 
@export var speed = 600.0 
@export var normal_speed = 600.0
@export var dash_speed = 3000.0
@export var jump = -800.0 
@export var downward_force = 1.3 
var walking: bool = false
var glitching: bool = false
#Connections
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	speed = normal_speed

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if not $Area2D.has_overlapping_areas():
		velocity += get_gravity() * delta * downward_force
	
	if Input.is_action_just_pressed("up") and has_jump == true and $Area2D.has_overlapping_areas():
		velocity.y = jump
		##anay, there is a glitch with wall_climb... its working with the jump button
	if Input.is_action_pressed("climb") and has_wall_climb == true and is_on_wall():
		velocity.y = jump
	

	var direction := Input.get_axis("left", "right")
	if direction and has_walk == true and glitching == false:
		velocity.x = direction * speed
		animated_sprite_2d.play("running")
		walking = true
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		walking = false
		animated_sprite_2d.play("idle")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("dash") and has_dash:
		speed = dash_speed
		await get_tree().create_timer(0.15).timeout
		speed = normal_speed
		

func _process(_delta: float) -> void:
	if velocity.x >= 3000 || velocity.x <= -3000 and is_on_wall_only() and not is_on_floor() and glitching == false:
		glitching = true
		collision_shape.disabled= true
		has_jump = false
		has_wall_climb = false
		speed = 0
		await get_tree().create_timer(0.1).timeout
		set_physics_process(false)
		await get_tree().create_timer(0.1).timeout
		speed *= 4
		glitching = false
		has_jump = true
		has_wall_climb = true
		set_physics_process(true)
		await get_tree().create_timer(1).timeout
		collision_shape.disabled = false
		await get_tree().create_timer(5).timeout
		speed = normal_speed
func player():
	pass 

func bouncy_wouncy():
	velocity.y = -300.0
	
func deadtp():
	global_position = Vector2(0, -4800)
	dying = true
	
func starttp():
	global_position = Vector2(0,-200)
	dying = false
