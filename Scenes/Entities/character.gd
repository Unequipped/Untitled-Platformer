class_name Character
extends CharacterBody2D

@export var SPEED = 65
@export var GRAVITY = 5

#@onready var animator: AnimatedSprite2D

enum type { ALLY, ENEMY }

var invulnerable:bool = false
# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false
