extends KinematicBody2D

export var speed = 800

var player_index = "1"
var deltaGlobal

func _ready():
	Serial.connect("sobe",self,"_on_sobe")
	Serial.connect("desce",self,"_on_desce")

func _physics_process(delta):
	deltaGlobal = delta
	if Input.is_action_pressed("move_up_player1"):
		move_and_collide(Vector2(0,-speed) * delta)
	if Input.is_action_pressed("move_down_player1"):
		move_and_collide(Vector2(0, speed)* delta)

func _on_sobe(player):
	print("Sobe o "+player)
	if player == player_index:
		move_and_collide(Vector2(0,-speed) * deltaGlobal)
		
func _on_desce(player):
	print("Desce o "+player)
	if player == player_index:
		move_and_collide(Vector2(0,speed) * deltaGlobal)
