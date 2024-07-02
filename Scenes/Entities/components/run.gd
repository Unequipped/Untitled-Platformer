extends State

@export var actor: CharacterBody2D
@export var idle_state: State
@export var fall_state: State
@export var jump_state: State

@export var SPEED: int = 80
var velocity: Vector2 = Vector2.ZERO

func run():
	if actor.get_input() != null:
		velocity.x = actor.get_input()
		velocity.x *= SPEED
		actor.vel.x = velocity.x

func enter():
	actor.state = actor.states.RUN

func process_input(event: InputEvent):
	return null

func process_frame(delta):
	if actor.get_input() > 0:
		actor.sprite_pivot.scale.x = 1
	elif actor.get_input() < 0:
		actor.sprite_pivot.scale.x = -1
	return null

func process_physics(delta):
	run()
