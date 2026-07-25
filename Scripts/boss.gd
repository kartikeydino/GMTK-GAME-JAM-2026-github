extends Area2D

enum States {IDLE, ATTACK_1, ATTACK_2, ATTACK_3}
@export var states = States.IDLE
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var health_bar = 4 

func decrease_health():
	health_bar -= 1 
	if health_bar == 0: 
		queue_free()

func _on_screw_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()


func _on_screw_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()


func _on_screw_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		


func _on_screw_4_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()

func _process(delta: float) -> void:
	attacks()

func attacks():
	var numbers = [1, 2, 3]
	var attack_type =  numbers.pick_random()
	if attack_type == 1:
		animation_player.play("1st")
	elif attack_type == 2:
		animation_player.play("2nd")
	elif attack_type == 3:
		animation_player.play("3rd")
