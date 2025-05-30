extends Label

@export var state_machine: StateMachine

var old_state: State = null

func _process(delta):
	if state_machine.current_state != null:
		if old_state == null:
			pass
		elif old_state != state_machine.current_state:
			text =  "Current State: " + state_machine.current_state.name + "\nPrevious State: " + old_state.name
		old_state = state_machine.current_state
