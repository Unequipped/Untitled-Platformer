class_name Movement
extends Node

@export var actor: CharacterBody2D
@export var input_manager: InputManager

@export var MAX_SPEED: int = 80
@export var crawl_speed: int = 40
var SPEED: int = 0
@export var y_accel: int = 6
@export var y_max: int = 200

## x movement lerping
@export var x_accel:float = 0.7
@export var x_decel:float = 0.4 #0.4 is better
# keeps the air drag tame, for a more platformer oriented game you might want this to be lower for more floaty feel
@export var x_decel_air:float = 0.05


var current_vel: Vector2
var x_vel: float
var attacking: bool = false


func _ready():
	SPEED = MAX_SPEED

func x_movement(target_speed, rate):
	var x_dir = input_manager.x_inp()
	if x_dir != 0:
		apply_x_accel(x_dir, target_speed, rate)
	else:
		if actor.is_on_floor():
			apply_x_decel(x_decel)
		else:
			apply_x_decel(x_decel_air)

func apply_x_accel(x_dir, target_speed, rate):
	actor.velocity.x = lerp(actor.velocity.x, target_speed * x_dir, rate)

func apply_x_decel(rate):
	actor.velocity.x = lerp(actor.velocity.x, 0.0, rate)

func apply_gravity():
	if actor.velocity.y < y_max:
		actor.velocity.y += y_accel
	elif actor.velocity.y >= y_max:
		actor.velocity.y = y_max

func _physics_process(_delta):
	if abs(actor.velocity.x) < 0.0001:
		actor.velocity.x = 0
	pass
