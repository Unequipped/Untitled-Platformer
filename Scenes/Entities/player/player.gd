class_name Player
extends CharacterBody2D

@onready var sprite_pivot: Node2D = $spritePivot
@onready var state_machine: Object = $state_machine
@onready var hitbox_comp: Area2D = $htibox_component

@export var animator:AnimatedSprite2D
@export var hp_comp: health_component
@export var dmg_box: Area2D

@export var roll_cd: int = 80

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
	var bodies:Array = dmg_box.get_overlapping_bodies()
	for body in bodies:
		if body.name == "player" or body.name == "playerTwo":
			body.hp_comp.take_dmg(1)
			if body.hp_comp.health <= 0:
				get_parent().reset_game()
				body.call_deferred("queue_free")
