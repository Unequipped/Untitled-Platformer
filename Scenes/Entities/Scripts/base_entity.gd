class_name Entity extends CharacterBody2D

# physics
@export var physics_collision_shape: CollisionShape2D

# sprite & animations
@export var sprite_pivot: Node2D
@export var sprite: Sprite2D
@export var animator: AnimatedSprite2D

func animate(animation: String = "", anim_to_check: String = "", reverse:bool = false): ## Animates & returns if animation is playing
	if animation:
		if !(animator.animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			if !reverse:
				animator.play(animation)
			else:
				animator.play_backwards(animation)
	return animator.is_playing()
