extends CharacterBody2D

const lettuce_cursor = preload("uid://bdbnpouilm10c")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer
const blobmite = preload("uid://b06uygu0xe6ff")
var blobmite_instantiate = blobmite.instantiate()

const SPEED = 900.0
const JUMP_VELOCITY = -800.0
var dying: bool = false
#list of variables for mechanics
var can_basic_walk: bool = true
var can_jump: bool = true
var can_direction_flip: bool = true
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
