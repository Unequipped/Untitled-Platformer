class_name Movement
extends Node

@export var actor: CharacterBody2D
@export var input_manager: InputManager

@export var SPEED: int = 80
@export var y_accel: int = 6
@export var y_max: int = 200

## x movement lerping
@export var x_accel:float = 0.7
@export var x_decel:float = 0.4
# keeps the air drag tame, for a more platformer oriented game you might want this to be lower for more floaty feel
@export var x_decel_air:float = 0.05


var current_vel: Vector2
var x_vel: float
var attacking: bool = false
static var rolling: bool = false

func x_movement(x_dir):
	x_vel = current_vel.x
	if x_dir != 0: # if player is inputting x movement
		x_vel = lerp(x_vel, SPEED * x_dir, x_accel)
	else: # neither control stick nor keyboar is being pressed
		if actor.is_on_floor():
			x_vel = lerp(x_vel, 0.0, x_decel)
		else:
			x_vel = lerp(x_vel, 0.0, x_decel_air)
	if actor.is_on_wall(): #causes a bug where you can't turn around immediately while facing/touching a wall
		x_vel = 0
	print(x_vel)
	return x_vel # x_vel #* SPEED

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
	
