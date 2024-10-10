extends Node
class_name shooting_component

@export var bullet :PackedScene


func _process(delta: float) -> void:
	pass
func shoot():
	var bullet_inst = bullet.instantiate()
	bullet_inst.position = self.position + Vector2(0, -80)
	get_tree().get_root().add_child(bullet_inst)
