class_name Player extends Entity

@onready var sprite_pivot: Node2D = $spritePivot

@onready var physics_collision_shape: CollisionShape2D = $physics_collision_shape
@onready var crouch_collision_shape: CollisionShape2D = $crouch_collision_shape
@onready var crouch_check: RayCast2D = $crouch_check

@onready var sprite: AnimatedSprite2D = $spritePivot/AnimatedSprite2D

# Movement related stuff 
var vel = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	if velocity.x > 0:
		sprite_pivot.scale.x = abs(sprite_pivot.scale.x)
	elif velocity.x < 0:
		sprite_pivot.scale.x = -abs(sprite_pivot.scale.x)

func crouch_collision(toggle):
	if toggle:
		crouch_collision_shape.disabled = false
		physics_collision_shape.disabled = true
	elif !toggle:
		crouch_collision_shape.disabled = true
		physics_collision_shape.disabled = false

func can_uncrouch():
	return !crouch_check.is_colliding() # returns false if is colliding because you CANT uncrouch
