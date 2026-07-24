extends Control
@onready var person: Label = $Person
@onready var text: Label = $Text

@export var letter_speed: int = 3
@export var person_name: String
@export var speech: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	person.visible_ratio = 0
	text.visible_ratio = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	person.text = person_name
	text.text = speech
	if(person.visible_ratio <1):
		person.visible_ratio += letter_speed * delta
	await get_tree().create_timer(1).timeout
	if(text.visible_ratio <1):
		text.visible_ratio += letter_speed * delta
