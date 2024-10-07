extends Node
class_name health_component

@export var MAX_HEALTH: int = 100
var health:int = 0

func _ready():
	health = MAX_HEALTH

func take_dmg(dmg_val): #might need to relocate this as well
	health -= dmg_val
	if health <= 0:
		get_parent().call_deferred("queue_free")
	print(health)
