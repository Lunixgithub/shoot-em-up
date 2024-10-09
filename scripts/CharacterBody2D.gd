extends CharacterBody2D
class_name Player

signal healthChanged
signal hitByPlayer

@export var maxHealth: int
@export var currentHealth: int:
	set(value):
		if value > maxHealth:
			value = maxHealth
		else:
			currentHealth = value
		healthChanged.emit()
var bullet = preload("res://scenes/bullet.tscn")
const SPEED = 500
@onready var hurtbox = $hurtbox


func _ready():
	currentHealth = maxHealth
	$ShootTimer.wait_time = 0.2
	$ShootTimer.one_shot = true  #oneshot

func _physics_process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")

	# x-axis movement
	if direction_x != 0:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# y axis movement
	if direction_y != 0:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		
	velocity = velocity.normalized() * 500
	

	move_and_slide()

	# Handle shooting
	if Input.is_action_pressed("ui_accept"):
		if $ShootTimer.is_stopped():
			shoot()
			
	
func shoot():
	var bullet_inst = bullet.instantiate()
	bullet_inst.position = self.position + Vector2(0, -80)
	get_tree().get_root().add_child(bullet_inst)
	$ShootTimer.start()


func hitByEnemy():
	print(currentHealth)
	currentHealth -=10
	if currentHealth == 0:
		get_tree().call_deferred("reload_current_scene")
	
