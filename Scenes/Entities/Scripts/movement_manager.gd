class_name Movement
extends Node

@export var actor: CharacterBody2D
@export var input_manager: LogicManager

@export var MAX_SPEED: int = 80
var SPEED: int = 0
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
static var unmovable: bool = false


func _ready():
	SPEED = MAX_SPEED

func x_movement(x_dir):
	actor.pivot(x_dir)
	x_vel = current_vel.x
	if x_dir != 0: # if player is inputting x movement
		x_vel = lerp(x_vel, SPEED * x_dir, x_accel)
	else: # neither control stick nor keyboard is being pressed
		if actor.is_on_floor():
			x_vel = lerp(x_vel, 0.0, x_decel)
		else:
			x_vel = lerp(x_vel, 0.0, x_decel_air)
	return x_vel

func y_movement():
	pass

func vec_movement():
	var new_vel:Vector2 = Vector2(actor.velocity.x, actor.velocity.y)
	var direction = input_manager.get_direction()
	new_vel.x = x_movement(direction.x)
	return new_vel

func apply_movement():
	current_vel = vec_movement()
	actor.set_velocity(current_vel)

func apply_gravity():
	if actor.velocity.y < y_max:
		actor.velocity.y += y_accel
	elif actor.velocity.y >= y_max:
		actor.velocity.y = y_max

func _physics_process(_delta):
	apply_gravity()
	if !unmovable:
		apply_movement()
