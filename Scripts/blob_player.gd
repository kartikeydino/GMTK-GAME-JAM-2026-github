extends CharacterBody2D

const lettuce_cursor = preload("uid://bdbnpouilm10c")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 900.0
const JUMP_VELOCITY = -800.0
var dying: bool = false
#list of variables for mechanics
var can_basic_walk: bool = true
var can_jump: bool = true
var can_direction_flip: bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if (can_jump):
		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			sprite.play("propeller hat jump")
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if (can_basic_walk):
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	if (can_direction_flip):
		if velocity.x > 1:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	if(is_on_floor()):
		sprite.play("default")

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
