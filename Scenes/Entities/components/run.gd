extends State

@export var actor: CharacterBody2D
@export var SPEED: int = 80

var velocity: Vector2 = Vector2.ZERO

func run():
	velocity.x = actor.get_input()
	velocity.x *= SPEED
	actor.vel.x = velocity.x

func enter():
	actor.state = actor.states.RUN

func process_input(event: InputEvent):
	pass

func process_frame(delta):
	return null

func process_physics(delta):
	run()
