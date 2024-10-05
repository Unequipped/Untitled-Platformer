class_name Enemy
extends CharacterBody2D

#@onready var sprite_pivot: Node2D = $spritePivot # not needed?
#@onready var state_machine: State_Machine = $state_machine # hasn't been added yet
@onready var hitbox_comp: Area2D = $htibox_component

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

func apply_dmg():
	var bodies:Array = dmg_box.get_overlapping_bodies()
	for body in bodies:
		if body.name == "enemy":
			#body.hp_comp.take_dmg(1)
			if body.hp_comp.health <= 0:
				get_parent().reset_game()
				body.call_deferred("queue_free")
