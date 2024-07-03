class_name MovementTwo
extends Node

@export var actor: CharacterBody2D
@export var input_manager: InputManagerTwo

@export var SPEED: int = 80
@export var y_accel: int = 3
@export var y_max: int = 200

var current_vel: Vector2
var attacking: bool = false
static var rolling: bool = false

func x_movement(x_dir):
	return x_dir * SPEED

func y_movement():
	pass

func vec_movement():
	var new_vel:Vector2 = Vector2(actor.velocity.x, actor.velocity.y)
	var direction = input_manager.get_direction()

	new_vel.x = x_movement(direction.x)
	#new_vel.y = y_movement(direction.y) # UNIMPLEMENTED
	
	return new_vel

func apply_movement():
	current_vel = vec_movement()
	actor.set_velocity(current_vel)

func apply_gravity():
	if actor.velocity.y < y_max:
		actor.velocity.y += y_accel
	elif actor.velocity.y >= y_max:
		actor.velocity.y = y_max

func _physics_process(delta):
	apply_gravity()
	if !rolling:
		apply_movement()
	
