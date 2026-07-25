extends CharacterBody2D

var dying = false
enum States {IDLE, BULLET}
#Abilities
@export var has_jump: bool = true
@export var has_dash: bool = true
@export var has_constant_dash: bool = true
@export var has_wall_climb: bool = true 
@export var has_walk: bool = true 
@export var has_glitch_fling: bool = true
#Movement 
@export var speed = 600.0 
@export var normal_speed = 600.0
@export var dash_speed = 3000.0
@export var jump = -800.0 
@export var downward_force = 1.3 
@export var states = States.IDLE
var walking: bool = false
var glitching: bool = false
var dashing: bool = false
#Connections
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionPolygon2D = $CollisionPolygon2D
@onready var area_2d: Area2D = $Area2D

var is_in_lvl_1: bool = true
var is_in_lvl_2: bool = false
var is_in_lvl_3: bool = false

func _ready() -> void:
	speed = normal_speed

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("up") and has_jump == true and is_on_floor():
		velocity.y = jump
		##anay, there is a glitch with wall_climb... its working with the jump button
	if Input.is_action_pressed("climb") and has_wall_climb == true and is_on_wall():
		velocity.y = jump
	

	var direction := Input.get_axis("left", "right")
	if direction and has_walk == true and glitching == false:
		velocity.x = direction * speed
		animated_sprite_2d.position.y = 6
		animated_sprite_2d.play("running")
		walking = true
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		walking = false
		animated_sprite_2d.position.y = 16
		animated_sprite_2d.play("idle")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("dash") and has_dash:
		speed = dash_speed
		dashing = true
		await get_tree().create_timer(0.15).timeout
		speed = normal_speed
		dashing = false

func player():
	pass 

func bouncy_wouncy():
	velocity.y = -300.0
	
func deadtp():
	global_position = Vector2(1600, -2450)
	dying = true
	await get_tree().create_timer(3).timeout
	starttp()
	
func starttp():
	if is_in_lvl_3:
		print("working")
		global_position = Vector2(11000,200)
		dying = false
	if is_in_lvl_1:
		global_position = Vector2(2300,400)
		dying = false
	if is_in_lvl_2:
		is_in_lvl_1 = false
		global_position = Vector2(6200,1300)
		dying = false
