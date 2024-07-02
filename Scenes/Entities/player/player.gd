class_name Player
extends CharacterBody2D

@export var animator:AnimatedSprite2D
@onready var sprite_pivot: Node2D = $spritePivot
@onready var state_machine: Object = $state_machine

@export var SPEED = 65
@export var GRAVITY = 5

# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false

enum states { IDLE, RUN, JUMP, FALL }
var state: states

func _ready():
	state = states.IDLE
	# initialisation
	state_machine.init(self)
	set_up_direction(Vector2.UP)

func _unhandled_input(event: InputEvent):
	state_machine.process_input(event)

func _physics_process(delta: float):
	set_velocity(vel)
	move_and_slide()
	state_machine.process_physics(delta)
	#movement()

func _process(delta: float):
	state_machine.process_frame(delta)
	animate()
	pass
	#dealing_with_states()


func get_input():
	var direction:Vector2 = Vector2.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1
	elif Input.is_action_pressed("left"):
		direction.x -= 1
	else:
		return null
	return direction.x


func animate():
	match state:
		states.IDLE:
			animator.play("idle")
		states.RUN:
			animator.play("run")
		states.JUMP:
			animator.play("jump")
		states.FALL:
			animator.play("fall")

#func dealing_with_states():
	#if is_on_floor():
		#if Input.get_axis("left", "right") != 0:
			#state = states.RUN
		#else:
			#state = states.IDLE
	#else:
		#if vel.y < 0:
			#state = states.JUMP
		#elif vel.y > 0:
			#state = states.FALL
		#else:
			#pass # if you adjust the if and elif condiitions you could add a jump/fall transition state

func movement():
	if Input.get_axis("left", "right") == -1:
		# unfortuantely using flip_h isn't that good because of the way the sprite isn't centred
		sprite_pivot.scale.x = -1 
	elif Input.get_axis("left", "right") == 1:
		sprite_pivot.scale.x = 1
	else:
		pass
	move_and_slide()

