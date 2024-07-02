class_name idle
extends State

@export var actor: CharacterBody2D
@export var falling_state: State
@export var jump_state: State
@export var run_state: State

func enter():
	actor.state = actor.states.IDLE

func process_input(event: InputEvent):
	if event.is_action_pressed("up"):
		return jump_state

	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		return run_state

	return null

func process_frame(delta):
	return null

func process_physics(delta):
	if !actor.is_on_floor() or actor.vel.y > 0:
		return falling_state


