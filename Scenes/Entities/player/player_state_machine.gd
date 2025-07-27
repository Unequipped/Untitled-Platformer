class_name PlayerStateMachine extends StateMachine

@export var actor: Player
@export var player_movement: Movement

func _ready():
	super()
	for state in states:
		states[state].actor = actor
		states[state].movement_manager = player_movement
		states[state].input_manager = input_provider
