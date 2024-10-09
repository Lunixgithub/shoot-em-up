extends Area2D

@export var enemy = preload("res://scenes/enemy.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	randomize()
	
func spawn():
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = Vector2(randi_range(-450, 450),0)
	enemy_instance.path = null
	add_child(enemy_instance)
	print(enemy_instance.position)
	


func _on_timer_timeout() -> void:
	spawn()
