class_name movement
extends Node

@export var actor: CharacterBody2D
@export var input_manager: InputManager

@export var SPEED: int = 80

var current_vel: Vector2

func x_movement(x_dir):
	return x_dir * SPEED

func y_movement():
	pass

func vec_movement():
	var new_vel:Vector2 = Vector2(actor.velocity.x, actor.velocity.y)
	var direction = input_manager.get_direction()

	new_vel.x = x_movement(direction.x)
	#new_vel.y = x_movement(direction.y) # UNIMPLEMENTED
	
	return new_vel

func apply_movement():
	current_vel = vec_movement()
	actor.set_velocity(current_vel)

func _physics_process(delta):
	apply_movement()
