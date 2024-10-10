extends Path2D
@export var enemy_scene = preload("res://scenes/enemy.tscn")
@export var speed = 500
@export var timerTime:float
var enemy_list = [] 

func _ready() -> void:
	
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = timerTime 
	timer.timeout.connect(spawn)
	add_child(timer)
	
func spawn() -> void:
	var pathfollow = PathFollow2D.new()
	pathfollow.loop = false
	pathfollow.rotates = false #dont loop for moving after end of path
	enemy_list.append(pathfollow)
	
	add_child(pathfollow)
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.movespeed = 0
	if pathfollow.progress >= 450:
		enemy_instance.movespeed = 500
	pathfollow.add_child(enemy_instance)
	

func _process(delta: float) -> void:
	for pathfollow in enemy_list:
		if pathfollow.progress_ratio < 1:
			pathfollow.progress += speed * delta
		elif pathfollow.get_child_count() != 0:
			var enemy_instance = pathfollow.get_child(0)
			if enemy_instance:
				enemy_instance.movespeed = 500
				
			
			
