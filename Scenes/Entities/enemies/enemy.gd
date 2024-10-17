class_name Enemy extends Entity

#@onready var sprite_pivot: Node2D = $spritePivot # not needed?
#@onready var state_machine: State_Machine = $state_machine # hasn't been added yet
@onready var hitbox_comp: Area2D = $hitbox_component

@onready var physics_collision_shape: CollisionShape2D = $physics_collision_shape

@export var sprite_pivot: Node2D

@export var hp_comp: health_component
@export var dmg_box: Area2D

@export var standard: bool = false

# Movement related stuff 
var vel = Vector2.ZERO
var walking:bool = false
var jumping:bool = false

var vulnerable: bool = true

func _ready():
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	pass

func pivot(facing):
	if facing > 0:
		sprite_pivot.scale.x = 0.5
	elif facing < 0:
		sprite_pivot.scale.x = -0.5
