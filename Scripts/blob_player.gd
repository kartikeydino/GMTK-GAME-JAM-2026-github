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
	if not is_on_floor():
		velocity += get_gravity() * delta
		if (jumping == false):
			anim_player.play("bobbing anim")
		anim_player.play("bobbing anim")
	if is_on_floor():
		anim_sprite.play("default")
		jumping = false
	elif not is_on_floor():
		anim_sprite.play("propeller hat jump")
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
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		blobmite_instantiate.transform.origin = Vector2(global_position.x + 100, global_position.y +100)
		get_tree().current_scene.add_child(blobmite_instantiate)

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
