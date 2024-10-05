class_name Slime_Enemy
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


func _ready():
	animate("idle")

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	pass

func animate(animation: String = ""):
	if animation:
		animator.play(animation)
		return animator.is_playing()
