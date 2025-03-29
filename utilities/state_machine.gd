class_name StateMachine extends Node

@export var actor: CharacterBody2D
@export var player_movement: Movement
@export var player_input: InputManager
@export var initial_state: State

var current_state: State

var states: Dictionary = {}


func _ready():
	store_all_states()
	if initial_state:
		current_state = initial_state


func change_state(state_name: StringName) -> void:
	if state_name and states.has(state_name):
		if current_state:
			current_state.exit()

			current_state = states[state_name]
			current_state.enter()


func check_switch(state):
## Travels backwards from active state
## checking superstate for any switches
	if state is State:
		if !state.switch_cond(): # check if switch condition met
			check_switch(state.get_parent())


func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
		check_switch(current_state)


func _process(delta):
	if current_state:
		current_state.update(delta)


func store_all_states():
	for child in get_children():
		if child is State: #and child.is_active:
			child.get_all_child_states(states, actor, self, player_movement, player_input)
## Gets all states within state machine and stores them
## States can be called later by name to get specific state
