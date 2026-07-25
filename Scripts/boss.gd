extends Area2D

enum States {IDLE, ATTACK_1, ATTACK_2, ATTACK_3}
@export var states = States.IDLE
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var health = 4 
@onready var player: CharacterBody2D = $"../Player"
@onready var health_bar: ProgressBar = $ProgressBar


func decrease_health():
	
	health -= 1
	health_bar.value -= health_bar.step
	if health == 0: 
		queue_free()

func _on_screw_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		queue_free()


func _on_screw_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		queue_free()


func _on_screw_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		queue_free()
		


func _on_screw_4_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		queue_free()

func _process(delta: float) -> void:
	attacks()

func attacks():
	var numbers = [1, 2, 3, 4]
	var attack_type =  numbers.pick_random()
	if attack_type == 1:
		animation_player.play("1st")
	elif attack_type == 2:
		pass
	elif attack_type == 3:
		pass
	elif attack_type == 4:
		animation_player.play("RESET")
