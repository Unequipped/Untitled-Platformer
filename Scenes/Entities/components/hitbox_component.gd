extends Area2D
class_name hitbox_component

@export var health: health_component
@export var actor: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func register_attack(dmg_value):
	health.take_dmg(dmg_value)
	print(actor.animate("hurt"))
