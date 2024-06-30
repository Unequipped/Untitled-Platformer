extends Node

@export var actor: CharacterBody2D

@export var min_grav: int = 1
@export var max_grav: int = 5
@export var term_vel: int = 200

func apply_gravity(gravity_weight: float = 1, friction: float = 1):
	var gravity = lerpf(min_grav, max_grav, gravity_weight) / friction
	if actor.vel.y + gravity < term_vel:
		actor.vel.y += gravity
	elif actor.vel.y > term_vel:
		actor.vel.y = term_vel
	
	if actor.is_on_floor():
		actor.vel.y = 0
	return actor.vel.y

func _physics_process(delta):
	apply_gravity()
