extends Control
@onready var person: Label = $Person
@onready var text: Label = $Text
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_player_2: AnimationPlayer = $AnimationPlayer2
@onready var choice1: Button = $Choice_1
@onready var choice2: Button = $Choice_2
@onready var choice3: Button = $Choice_3
@onready var choice4: Button = $Choice_4
@onready var next: Button = $Next

var next_counter: int = 0
@export var letter_speed: int = 3
@export var person_name: String
@export var speech: String
@export var choice_1_text: String
@export var choice_2_text: String
@export var choice_3_text: String
@export var choice_4_text: String
@export var choice_1_response: String
@export var choice_2_response: String
@export var choice_3_response: String
@export var choice_4_response: String
@export var area2d: Area2D
@export var target : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	person.visible_ratio = 0
	text.visible_ratio = 0
	choice1.text = choice_1_text
	choice2.text = choice_2_text
	choice3.text = choice_3_text
	choice4.text = choice_4_text
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if area2d.player_entered == true:
		person.text = person_name + ":"
		text.text = speech
		self.visible = true
		if person.visible_ratio <1 || text.visible_ratio < 1:
			anim_player.play("text_for_textbox")
			next.disabled = true
		else:
			next.disabled = false
			
	if next_counter == 1:
		await get_tree().create_timer(1).timeout
		person.visible = false
		text.visible = false
		person.visible_ratio = 0
		text.visible_ratio = 0
		anim_player_2.play("button_for_textbox")
		await get_tree().create_timer(2).timeout
		choice1.visible = true
		choice1.self_modulate.a = 255
		choice2.visible = true
		choice2.self_modulate.a = 255
		choice3.visible = true
		choice3.self_modulate.a = 255
		choice4.visible = true
		choice4.self_modulate.a = 255
		anim_player_2.stop()


func _on_next_pressed() -> void:
	next_counter += 1
	print(next_counter)
	anim_player.stop()

func _on_choice_1_pressed() -> void:
	speech = choice_1_text
	next_counter +=1
	queue_free()
	get_tree().change_scene_to_packed(target)

func _on_choice_2_pressed() -> void:
	speech = choice_2_text
	next_counter +=1
	queue_free()
	get_tree().change_scene_to_packed(target)

func _on_choice_3_pressed() -> void:
	speech = choice_3_text
	next_counter +=1
	queue_free()
	get_tree().change_scene_to_packed(target)


func _on_choice_4_pressed() -> void:
	speech = choice_4_text
	next_counter +=1
	queue_free()
	get_tree().change_scene_to_packed(target)
