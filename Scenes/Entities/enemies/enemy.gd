class_name Enemy
extends CharacterBody2D

#@onready var sprite_pivot: Node2D = $spritePivot # not needed?
#@onready var state_machine: State_Machine = $state_machine # hasn't been added yet
@onready var hitbox_comp: Area2D = $hitbox_component

@onready var physics_collision_shape: CollisionShape2D = $physics_collision_shape

@export var animator:AnimationPlayer #: AnimatedSprite2D
@export var hp_comp: health_component
@export var dmg_box: Area2D

@export var standard: bool = false

# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false

var vulnerable: bool = true

func _ready():
	animate("idle")

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	pass

# We need an entity class that has this function instead of just copying it
func animate(animation: String = "", anim_to_check: String = "", reverse:bool = false): ## Animates & returns if animation is playing
	if animation:
		if !(animator.current_animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			if !reverse:
				animator.play(animation)
			else:
				animator.play_backwards(animation)
	return animator.is_playing()
