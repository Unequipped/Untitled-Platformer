class_name PlayerStateMachine extends StateMachine

@export var actor: Player
@export var player_movement: Movement
@export var player_input: InputManager

func _ready():
	super()
	for state in states:
		states[state].actor = actor
		states[state].movement_manager = player_movement
		states[state].input_manager = player_input
		print(state)
