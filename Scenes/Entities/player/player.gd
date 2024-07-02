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
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	pass

func animate(animation: String):
	animator.play(animation)
