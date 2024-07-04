extends Node
class_name health_component

@export var MAX_HEALTH: int = 100
var health:int = 0

func _ready():
	health = MAX_HEALTH

func take_dmg(dmg_val):
	health -= dmg_val
