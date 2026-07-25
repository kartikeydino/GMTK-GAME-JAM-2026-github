extends Area2D

enum States {IDLE, ATTACK_1, ATTACK_2, ATTACK_3}
@export var states = States.IDLE
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var health = 4 
@onready var health_bar: ProgressBar = $ProgressBar
@onready var screw: Area2D = $Screw
@onready var screw_2: Area2D = $Screw2
@onready var screw_3: Area2D = $Screw3
@onready var screw_4: Area2D = $Screw4
signal died
func decrease_health():
	health -= 1
	health_bar.value -= 25
	if health <= 0: 
		died.emit()
		queue_free()

func _on_screw_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		screw.queue_free()



func _on_screw_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		screw_2.queue_free()




func _on_screw_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		screw_3.queue_free()


func _on_screw_4_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		decrease_health()
		screw_4.queue_free()
