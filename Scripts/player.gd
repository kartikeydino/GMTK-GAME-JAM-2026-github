extends CharacterBody2D

const lettuce_cursor = preload("uid://bdbnpouilm10c")
@onready var dielabel: Label = $Label

const SPEED = 700.0
const JUMP_VELOCITY = -700.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
func _process(_delta: float) -> void:
	Input.set_custom_mouse_cursor(lettuce_cursor, Input.CURSOR_ARROW)

func player():
	pass 

func bouncy_wouncy():
	velocity.y = -300.0
