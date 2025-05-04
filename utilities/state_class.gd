class_name State extends Node

var actor: CharacterBody2D #Auto assign parent entity to each state
var state_machine: StateMachine
var movement_manager: Movement
var input_manager: InputManager
var animations: AnimatedSprite2D
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

func get_all_child_states(states:Dictionary, actor, state_machine, movement_manager, input_manager, current_path):
	self.actor = actor
	self.state_machine = state_machine
	self.movement_manager = movement_manager
	self.input_manager = input_manager
	states[self.name] = self
	
	#if current_path != null:
		#self.state_path.append_array(current_path)
		#self.state_path.append(self.name)
	#
	#print(state_path)
	
	create_path_list(self)
	
	var children = get_children()
	if children.size() > 0: # checks if the current state has children states
		for child in children:
			if child is State:
				#child.state_path.append(self)
				#create_path_list(child)
				child.get_all_child_states(states, actor, state_machine, movement_manager, input_manager, null)
	else:
		return

func create_path_list(state: State): # generates paths from state_machine to a state
	var node_path: NodePath = state_machine.get_path_to(state)
	state_path = node_path.get_concatenated_names().split("/")
	print(state, state_path)

func process_branch():
	pass
