extends shooting_component

@export var timer = Timer.new()
func _ready():
	timer.wait_time = 0.2
	timer.one_shot = true
	add_child(timer)
	timer.start()

func shoot():
	if timer.is_stopped():
		super.shoot()
		timer.start()
