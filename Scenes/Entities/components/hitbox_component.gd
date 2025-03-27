extends Area2D
class_name hitbox_component

## Updated
## This component should only check if an attack has hit the player
## There's no need to start calling lots of functions from here
## Leave that to the parent


@export var health: health_component
@export var actor: Entity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func register_attack(dmg_value):
	actor.rec_hit(dmg_value)
