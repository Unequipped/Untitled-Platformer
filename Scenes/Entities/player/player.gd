extends Character

@export var animator:AnimatedSprite2D

@export var JUMP:int = 110
@export var buffer_time: float = 0.1

@onready var sprite_pivot: Node2D = $spritePivot

var jump_buffer_timer: float = 0.0

enum states {
		IDLE,
		RUN,
		JUMP,
		FALL
		}

var state: states

func _ready():
	set_up_direction(Vector2.UP)

func get_input():
	var direction:Vector2 = Vector2.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
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

func dealing_with_states():
	if is_on_floor():
		if Input.get_axis("left", "right") != 0:
			state = states.RUN
		else:
			state = states.IDLE
	else:
		if vel.y < 0:
			state = states.JUMP
		elif vel.y > 0:
			state = states.FALL
		else:
			pass # if you adjust the if and elif condiitions you could add a jump/fall transition state

func movement():
	vel.x = get_input()
	if Input.get_axis("left", "right") == -1:
		# unfortuantely using flip_h isn't that good because of the way the sprite isn't centred
		sprite_pivot.scale.x = -1 
	elif Input.get_axis("left", "right") == 1:
		sprite_pivot.scale.x = 1
	else:
		pass
	vel.x *= SPEED
	set_velocity(vel)
	move_and_slide()

func _process(delta):
	dealing_with_states()
	animate()

func _physics_process(_delta):
	movement()

