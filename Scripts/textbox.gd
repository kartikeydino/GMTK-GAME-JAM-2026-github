extends Control
@onready var person: Label = $Person
@onready var text: Label = $Text

@export var letter_speed: int = 3
@export var person_name: String
@export var speech: String
@export var area2d: Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	person.visible_ratio = 0
	text.visible_ratio = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if area2d.player_entered == true:
		person.text = person_name
		text.text = speech
		self.visible = true
		if(person.visible_ratio <1):
			if (text.visible_ratio < 1):
				animation_player.play("text_for_textbox")
		await get_tree().create_timer(6).timeout
		self.queue_free()
