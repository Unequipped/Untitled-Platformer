class_name StateMachine extends Node

@export var initial_state: State
@export var movementManager: Movement
@export var inputManager: LogicManager

var current_state: State
var states: Dictionary = {} #the Transitioned.emit(self, "") needs dictionary to work.

func _ready():
	for child in get_children():
		if child is State:
			child.inputManager = inputManager
			child.movementManager = movementManager
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transitioned)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func on_child_transitioned(state:State, new_state_name, data := {}):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter(state.name, data)
	current_state = new_state
