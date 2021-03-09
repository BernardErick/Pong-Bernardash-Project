extends KinematicBody2D

export var speed = 800

var player_index = "2"
var deltaGlobal
var valueGlobal = 80

func _ready():
	Serial.connect("potenciometro", self, "_on_potenciometro")
	
func _physics_process(delta):
	if Input.is_action_pressed("move_up_player2"):
		move_and_collide(Vector2(0,-speed) * delta)
	if Input.is_action_pressed("move_down_player2"):
		move_and_collide(Vector2(0, speed)* delta)
		
		
func _on_potenciometro(player, value):
	if player == player_index:
		position.y = int(value)

			
