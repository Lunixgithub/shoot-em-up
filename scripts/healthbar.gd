extends ProgressBar

@export var player: Player
func _ready():
	update()
	player.healthChanged.connect(update)
func update():
	value = player.currentHealth * 100 / player.maxHealth
