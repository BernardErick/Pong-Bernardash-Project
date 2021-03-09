extends TextureButton

func _process(delta):
	if Input.is_key_pressed(32):
		get_tree().change_scene("res://scenes/Main.tscn")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
