class_name State_Machine
extends Node
 
@export var starting_state: State
var current_state: State

enum states {
		IDLE,
		WALK,
		JUMP,
		}

func init(parent):
	change_state(starting_state)

func change_state(new_state):
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func process_physics(delta):
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta):
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)


#func enter():
	#pass
#
#func exit():
	#pass
#
#func update():
	#pass
#
#func physics_update():
	#pass
#
#func switch_state():
	#pass
