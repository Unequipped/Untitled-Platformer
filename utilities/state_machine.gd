class_name StateMachine extends Node

@export var initial_state: State

var current_state: State
var new_state: State
var states: Dictionary = {}


func _ready():
	store_all_states()
	if initial_state:
		current_state = initial_state


func change_state(state_name: StringName) -> void:
	if current_state and state_name and states.has(state_name): #if the state_name is valid
		new_state = states[state_name]
		var pointer: Node = current_state
			
		for path_step in find_route(current_state, new_state): # for each step in the path
			if pointer.get_node(path_step) != null: # check if it's valid
				pointer = pointer.get_node(path_step) # increment
				
				# Moving UP the state tree
				if path_step == "..": # if you're moving up the tree
					current_state.exit() # exit the state you're in
					current_state.active = false # set it as inactive
					if pointer is State:
						current_state = pointer
				
				 # Moving DOWN the state tree
				else:
					current_state = pointer
					current_state.enter()
					current_state.active = true
				
				#continue looping


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
		check_switch(current_state)


func _process(delta):
	if current_state:
		run_state(current_state, false, delta)


func find_route(base, target):
	var node_path: NodePath = base.get_path_to(target)
	return node_path.get_concatenated_names().split("/")


func store_all_states():
## Gets all states within state machine and stores them
## States can be called later by name to get specific state
	for child in get_children():
		if child is State: #and child.is_active:
			# passing reference to the states dictionary and state machine (self)
			# this is bare minimum required for anything that will use states/statemachines
			child.get_all_child_states(states, self)
