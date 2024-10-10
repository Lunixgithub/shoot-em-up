extends CharacterBody2D
@onready var player = get_tree().get_root().get_node("Node2D/Player")
@export var path:PathFollow2D
@export var movespeed: int

var timer: Timer
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.5
	timer.timeout.connect(timeout)

func _physics_process(delta):
	if path != self.get_parent():
		velocity.y = movespeed
		move_and_slide()
	elif path.progress_ratio == 1:
		velocity.y = movespeed
		move_and_slide()
	if position.y > 1000:
		queue_free()

		
func _on_hit_detection_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
	if area.name == "hurtbox":
		$HitDetection.set_deferred("monitoring",false)
		player.hitByEnemy()
		die()
		

func die():
	timer.start()
	print(timer.wait_time)
	movespeed = 0

func timeout():
	queue_free()
	
