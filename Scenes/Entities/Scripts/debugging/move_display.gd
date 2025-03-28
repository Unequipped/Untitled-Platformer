extends Label

@export var player_movement: Movement

var old_state: State = null

func _process(delta):
	text = str(player_movement.actor.velocity)
