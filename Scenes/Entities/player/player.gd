class_name Player
extends CharacterBody2D

@onready var sprite_pivot: Node2D = $spritePivot
@onready var state_machine: State_Machine = $state_machine
@onready var hitbox_comp: Area2D = $hitbox_component

@onready var physics_collision_shape: CollisionShape2D = $physics_collision_shape
@onready var crouch_collision_shape: CollisionShape2D = $crouch_collision_shape
@onready var crouch_check:RayCast2D = $crouch_check

@export var animator: AnimatedSprite2D
@export var hp_comp: health_component
@export var dmg_box: Area2D

@export var roll_cd: int = 100 # Need to fix this later
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

func animate(animation: String = "", anim_to_check: String = ""): ## Animates & returns in animation is playing
	if animation:
		if !(animator.animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			animator.play(animation)
	return animator.is_playing()

func apply_dmg():
	var bodies:Array = dmg_box.get_overlapping_bodies()
	for body in bodies:
		print(body.name)
		if body.is_in_group("enemies"):
			body.hp_comp.take_dmg(1)
			if body.hp_comp.health <= 0:
				body.call_deferred("queue_free")

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
