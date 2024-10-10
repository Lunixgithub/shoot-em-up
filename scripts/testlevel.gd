extends Node2D
@onready var standartpos = $ParallaxBackground/Background.position.y



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$ParallaxBackground/Background.position.y+=1
	if $ParallaxBackground/Background.position.y > 1200:
		$ParallaxBackground/Background.position.y = standartpos
