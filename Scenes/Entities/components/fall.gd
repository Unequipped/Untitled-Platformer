class_name Fall
extends State

@export var actor: CharacterBody2D

@export var idle_state: State

var y_accel: float = 2
var y_speed: float = 0.0
var term_vel: float = 200

func enter():
	actor.state = actor.states.FALL

func process_physics(delta):
	return apply_gravity()

func apply_gravity():
	if actor.vel.y < term_vel:
		actor.vel.y += y_accel
	elif actor.vel.y > term_vel:
		actor.vel.y = term_vel
	
	if actor.is_on_floor():
		y_speed = 0
		actor.vel.y = 0
		return idle_state
	
	return null

