class_name StateMachine extends Node

@export var actor: CharacterBody2D
@export var player_movement: Movement
@export var player_input: InputManager
@export var initial_state: State

var current_state: State
var new_state: State
var states: Dictionary = {}


func _ready():
	store_all_states()
	if initial_state:
		current_state = initial_state


func change_state(state_name: StringName) -> void:
	if state_name and states.has(state_name): #if the state_name is valid
		new_state = states[state_name]
		if current_state: # if we're currently in a valid state
			var pointer: Node = current_state
			
			for path_step in find_route(current_state, new_state):
				if pointer.get_node(path_step) != null:
					pointer = pointer.get_node(path_step)
					if path_step == "..":
						current_state.exit()
						current_state.active = false
						if pointer is State:
							current_state = pointer
					else:
						current_state = pointer
						current_state.enter()
						current_state.active = true


func check_switch(state):
## Travels backwards from active state
## checking superstate for any switches
	if state is State:
		if !state.switch_cond(): # check if switch condition met
			#state.default_switch()
			check_switch(state.get_parent())


func run_state(state: State, physics, delta):
## Travels forwards from statemachine to active state
## runs states along the branch
	var path: Array = state.state_path
	var live_state: State
	for i in path:
		live_state = states[i]
		if physics:
			live_state.physics_update(delta)
		else:
			live_state.update(delta)


func _physics_process(delta):
	if current_state:
		run_state(current_state, true, delta)
		#current_state.physics_update(delta)
		check_switch(current_state)


func _process(delta):
	if current_state:
		#current_state.update(delta)
		run_state(current_state, false, delta)


func find_route(base, target):
	var node_path: NodePath = base.get_path_to(target)
	return node_path.get_concatenated_names().split("/")


func store_all_states():
## Gets all states within state machine and stores them
## States can be called later by name to get specific state
	for child in get_children():
		if child is State: #and child.is_active:
			child.get_all_child_states(states, actor, self, player_movement, player_input)
