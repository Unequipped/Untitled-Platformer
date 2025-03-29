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
	print(states)


func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()


func check_switch(state_name):
	# check if a switch_state() condition has triggered
	# find the state you need to switch to
	# execute switch state
	# THE ABOVE IS N/A FOR CURRENT IMPLEMENTATION
	if state_name and states.has(state_name):
		change_state(states[state_name])
	pass


func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
	
	current_state.switch_cond()


func _process(delta):
	if current_state:
		current_state.update(delta)


func store_all_states():
	for child in get_children():
		if child is State: #and child.is_active:
			child.get_all_child_states(states, actor, self, player_movement, player_input)
## Gets all states within state machine and stores them
## States can be called later by name to get specific state
