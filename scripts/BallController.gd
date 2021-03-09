extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO

func _ready():
	velocity.x = 0.5
	velocity.y = 0.5

	
func _physics_process(delta):
	movimentLogic(delta)

func movimentLogic(delta):
	
	var collision_object  = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		
func stop_ball():
	speed = 0
func restart_ball():
	speed = 400



