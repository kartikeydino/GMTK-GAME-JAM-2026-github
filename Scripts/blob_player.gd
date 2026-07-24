extends CharacterBody2D
@onready var antt_enemy: Area2D = $"../Ant Enemy"
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
const blobmite = preload("uid://b8pwc3yrhgv13")
var blobmite_instantiate = blobmite.instantiate()
@export var antler_enemy: Area2D
var SPEED = 900.0
const normal_speed = 900
const JUMP_VELOCITY = -800.0
var dying: bool = false
#list of variables for mechanics
var can_basic_walk: bool = true
var can_jump: bool = true
var can_direction_flip: bool = true
var can_dash: bool = true

var is_left : bool
var jumping: bool = false



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() or jumping == true:
		anim_sprite.play("propeller hat jump") 
		velocity += get_gravity() * delta
		anim_player.play("flying reset")
	if is_on_floor():
		anim_sprite.play("default")
		anim_player.play("bobbing anim")
		jumping = false
	if (can_jump):
		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			await get_tree().create_timer(0.05).timeout
			jumping = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if (can_basic_walk):
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		if direction == -1:
			anim_sprite.flip_h = true
		else:
			anim_sprite.flip_h = false

	if (can_dash) && Input.is_action_just_pressed("dash"):
		SPEED *= 2
		await get_tree().create_timer(1).timeout
		SPEED = normal_speed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		blobmite_instantiate.ant_enemy = antt_enemy
		get_tree().current_scene.add_child(blobmite_instantiate)
		blobmite_instantiate.transform.origin = Vector2(global_position.x, global_position.y)

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
