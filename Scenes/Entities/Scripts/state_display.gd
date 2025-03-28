extends Label

@export var state_machine: StateMachine

func _process(delta):
	if state_machine.current_state != null:
		text = state_machine.current_state.name
