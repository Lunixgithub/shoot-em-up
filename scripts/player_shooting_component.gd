extends shooting_component


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		shoot()
