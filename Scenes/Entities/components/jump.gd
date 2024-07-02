class_name Jumper
extends State

@export var actor: CharacterBody2D
@export var jump_height: int = 110
@export var buffer_time: float = 0.05

var jump_buffer_timer: float = 0.0

func _ready():
	pass

func animate():
	actor.states.JUMP
	#actor.animator.play("jump")

func _physics_process(delta):
	if actor.is_on_floor():
		if jump_buffer_timer > 0:
			actor.vel.y -= jump_height
			animate()

func _input(event):
	if event.is_action_pressed("up"):
		jump_buffer_timer = buffer_time

func _process(delta):
	jump_buffer_timer -= delta

