class_name Movement extends Node
## Base movement class for all entities

@export var actor: CharacterBody2D
@export var input_provider: LogicManager

@export var MAX_SPEED: int = 100
@export var walk_speed: int = 80

var SPEED: int = 0

# Gravity 
@export var y_accel: int = 6
@export var y_max: int = 200

## x movement lerping
@export var x_accel:float = 0.7
@export var x_decel:float = 0.4 #0.4 is better

@export var x_air_decel:float = 0.06
@export var x_air_accel:float = 0.2


func _ready():
	SPEED = MAX_SPEED

func x_movement(target_speed, rate):
	var x_dir = input_provider.x_inp()
	if x_dir != 0: #if you ARE moving
		if actor.is_on_floor():
			apply_x_accel(x_dir, target_speed, rate)
		else:
			apply_x_accel(x_dir, target_speed, x_air_accel)
	else:
		if actor.is_on_floor():
			apply_x_decel(x_decel)
		else:
			apply_x_decel(x_air_decel)

func apply_x_accel(x_dir, target_speed, rate):
	#actor.velocity.x = move_toward(actor.velocity.x, target_speed * x_dir, rate)
	#if input_provider.run_inp() and input_provider.y_inp() >= 0:
		#actor.velocity.x = lerpf(actor.velocity.x, MAX_SPEED * x_dir, rate)
	#else:
		actor.velocity.x = lerpf(actor.velocity.x, target_speed * x_dir, rate)

func apply_x_decel(rate):
	actor.velocity.x = lerpf(actor.velocity.x, 0.0, rate)
	if abs(actor.velocity.x) <= 0.001:
		actor.velocity.x = 0

func apply_gravity():
	actor.velocity.y = move_toward(actor.velocity.y, y_max, y_accel)

func y_movement(grip):
	actor.velocity.y = grip

func _physics_process(_delta):
	#actor.velocity.x = snapped(actor.velocity.x, 0.0001)
	pass

## Physics checks
#func can_slide():
	#return abs(actor.velocity.x) > walk_speed
