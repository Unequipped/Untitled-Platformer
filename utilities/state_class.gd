class_name State extends Node

var actor: CharacterBody2D #Auto assign parent entity to each state
var state_machine: StateMachine
var movement_manager: Movement
var input_manager: InputManager
var animations: AnimatedSprite2D

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
	return false

func get_all_child_states(states:Dictionary, actor, state_machine, movement_manager, input_manager):
	self.actor = actor
	self.state_machine = state_machine
	self.movement_manager = movement_manager
	self.input_manager = input_manager
	states[self.name] = self
	
	var children = get_children()
	if children.size() > 0: # checks if the current state has children states
		for child in children:
			if child is State:
				child.get_all_child_states(states, actor, state_machine, movement_manager, input_manager)
	else:
		return

func process_branch():
	pass
