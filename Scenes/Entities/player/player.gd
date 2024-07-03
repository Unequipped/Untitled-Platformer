class_name Player
extends CharacterBody2D

@onready var sprite_pivot: Node2D = $spritePivot
@onready var state_machine: Object = $state_machine
@onready var hitbox_comp: Area2D = $htibox_component

@export var animator:AnimatedSprite2D
@export var dmg_box: Area2D

@export var SPEED = 65
@export var GRAVITY = 5
@export var roll_cd: int = 100

# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false

enum states { IDLE, RUN, JUMP, FALL }
var state: states

func _ready():
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	if roll_cd < 100:
		roll_cd +=1
	else:
		roll_cd = 100

func animate(animation: String):
	if velocity.x > 0:
		sprite_pivot.scale.x = 1
	elif velocity.x < 0:
		sprite_pivot.scale.x = -1
	animator.play(animation)
	return animator.is_playing()

func apply_dmg():
	var bodies_list:Array = dmg_box.get_overlapping_bodies()
	# check if bodies list has an enemy
	# if it has an enemy apply dmg to it
