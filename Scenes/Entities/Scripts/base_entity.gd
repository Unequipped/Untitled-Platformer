class_name Entity extends CharacterBody2D

@export var animator: AnimatedSprite2D

func pivot(facing):
	return

func animate(animation: String = "", anim_to_check: String = "", reverse:bool = false): ## Animates & returns if animation is playing
	if animation:
		if !(animator.animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			if !reverse:
				animator.play(animation)
			else:
				animator.play_backwards(animation)
	return animator.is_playing()
