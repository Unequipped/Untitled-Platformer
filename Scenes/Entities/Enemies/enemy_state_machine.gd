class_name EnemyStateMachine extends StateMachine

@export var actor: CharacterBody2D
@export var enemy_movement: Movement

func _ready():
	super()
	for state in states:
		states[state].actor = actor
		states[state].movement_manager = enemy_movement
		states[state].input_manager = input_provider
