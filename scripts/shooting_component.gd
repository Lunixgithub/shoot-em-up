extends Node
class_name shooting_component

@export var bullet :PackedScene
@export var bulletSpawnPosition :int #represents the spawnposition(either for player or enemy)

func shoot():
	var bullet_inst = bullet.instantiate()
	bullet_inst.position = get_parent().position + Vector2(0, bulletSpawnPosition)
	get_tree().get_root().add_child(bullet_inst)
