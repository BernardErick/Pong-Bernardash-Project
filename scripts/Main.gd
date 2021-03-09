extends Node2D
#codigo para interações entre nodes de cenas
var scorePlayer1 = 0
var scorePlayer2 = 0


func _process(delta):
	$ScorePlayer1.text = str(scorePlayer1)
	$ScorePlayer2.text = str(scorePlayer2)
func _on_Left_body_entered(body):
	$Ball.position = Vector2(450,300)
	$Ball.velocity.x *= -1
	scorePlayer2 += 1
	get_tree().call_group('Ball','stop_ball')
	$Ball.get_node("Sprite").texture = preload("res://assets//Images/ball_stone.png")
	$CountdownTimer.start()
	
	
func _on_Right_body_entered(body):
	$Ball.position = Vector2(450,300)
	$Ball.velocity.x *= -1
	scorePlayer1 += 1
	get_tree().call_group('Ball','stop_ball')
	$Ball.get_node("Sprite").texture = preload("res://assets//Images/ball_stone.png")
	$CountdownTimer.start()
	print("Entrou na direita")
	

func _on_Ball_body_entered(body):
	if body == $PaddlePlayer1:
		$Ball.get_node("Sprite").texture = preload("res://assets//Images//ball_water.png")
	if body == $PaddlePlayer2:
		$Ball.get_node("Sprite").texture = preload("res://assets//Images/ball_fire.png")
	if body == $PaddlePlayer1 || body == $PaddlePlayer2:
		if get_node("Ball").speed <= 1500:
			get_node("Ball").speed += 50
			print(get_node("Ball").speed)
	
func _on_CountdownTimer_timeout():

	get_tree().call_group('Ball','restart_ball')
