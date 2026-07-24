extends Control
@onready var person: Label = $Person
@onready var text: Label = $Text
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var choice1: Button = $Choice_1
@onready var choice2: Button = $Choice_2
@onready var choice3: Button = $Choice_3
@onready var choice4: Button = $Choice_4

var next_counter: int
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
		if(person.visible_ratio <1):
			if (text.visible_ratio < 1):
				animation_player.play("text_for_textbox")

	if next_counter == 1:
		person.visible = false
		text.visible = false
		person.visible_ratio = 0
		text.visible_ratio = 0
		animation_player.play("button_for_textbox")
		
	if next_counter == 2:
		person.visible = true
		person.text = "You"
		text.visible = true
		text.text = speech
		animation_player.play("text_for_textbox")

func _on_next_pressed() -> void:
	next_counter += 1

func _on_choice_1_pressed() -> void:
	speech = choice_1_text
	next_counter +=1

func _on_choice_2_pressed() -> void:
	speech = choice_2_text
	next_counter +=1

func _on_choice_3_pressed() -> void:
	speech = choice_3_text
	next_counter +=1

func _on_choice_4_pressed() -> void:
	speech = choice_4_text
	next_counter +=1
