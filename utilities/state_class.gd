class_name State extends Node

var active: bool = false

var state_machine: StateMachine
var state_path: Array

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass

func switch_cond() -> bool:
	return false

func default_switch(): # check if there's a default substate to switch to
	return false # doesn't work properly

func get_all_child_states(states:Dictionary, state_machine):
	self.state_machine = state_machine
	states[self.name] = self
	
	create_path_list(self)
	
	var children = get_children()
	if children.size() > 0: # checks if the current state has children states
		for child in children:
			if child is State:
				child.get_all_child_states(states, state_machine)
	else:
		return

func create_path_list(state: State): # generates paths from state_machine to a state
	var node_path: NodePath = state_machine.get_path_to(state)
	state_path = node_path.get_concatenated_names().split("/")
