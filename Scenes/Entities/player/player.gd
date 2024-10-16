class_name Player extends Entity

@onready var sprite_pivot: Node2D = $spritePivot
@onready var state_machine: StateMachine = $state_machine
@onready var movement: Movement = $movement
@onready var hitbox_comp: Area2D = $hitbox_component

@onready var physics_collision_shape: CollisionShape2D = $physics_collision_shape
@onready var crouch_collision_shape: CollisionShape2D = $crouch_collision_shape
@onready var crouch_check: RayCast2D = $crouch_check

@export var hp_comp: health_component
@export var dmg_box: Area2D

@export var roll_cd: int = 100 # Need to fix this later
@export var damage: int = 10
@export var standard: bool = false

# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false


func _ready():
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	roll_cd_dec()

#func animate(animation: String = "", anim_to_check: String = "", reverse:bool = false): ## Animates & returns if animation is playing
	#if animation:
		#if !(animator.animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			#if !reverse:
				#animator.play(animation)
			#else:
				#animator.play_backwards(animation)
	#return animator.is_playing()

func apply_dmg():
	var areas:Array = dmg_box.get_overlapping_areas()
	for area in areas:
		if area.is_in_group("enemies"):
			area.register_attack(damage)

func crouch_collision(toggle):
	if toggle:
		crouch_collision_shape.disabled = false
		physics_collision_shape.disabled = true
	elif !toggle:
		crouch_collision_shape.disabled = true
		physics_collision_shape.disabled = false

func can_uncrouch():
	return !crouch_check.is_colliding() # returns false if is colliding because you CANT uncrouch

func roll_cd_dec(): # This function should be in roll, not here
	if roll_cd < 100: # energy should be a component
		roll_cd +=1
	else:
		roll_cd = 100

func pivot(facing):
	if !(get_current_state() == "attack2" or get_current_state() == "attack"): # not the best way to do this
		if facing > 0:
			sprite_pivot.scale.x = 1
		elif facing < 0:
			sprite_pivot.scale.x = -1

func get_current_state():
	return state_machine.current_state.name
