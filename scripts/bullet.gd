extends CharacterBody2D
func _physics_process(delta):
	velocity.y =$bullet_information.speed *delta*100 
	
	move_and_slide()


func _on_area_2d_area_entered(area):
	queue_free()
