class_name Entity extends CharacterBody2D

@export var animator: AnimatedSprite2D

var is_hit: bool # A variable for checking if the entity has been hit

func pivot(facing):
	return

func rec_hit(damage): 
	is_hit = true
	print("ok")
	# register damage taken to hp
	# end
	pass

func animate(animation: String = "", anim_to_check: String = "", reverse:bool = false): ## Animates & returns if animation is playing
	if animation:
		if !(animator.animation == anim_to_check and animator.is_playing() and anim_to_check != ""):
			if !reverse:
				animator.play(animation)
			else:
				animator.play_backwards(animation)
	return animator.is_playing()
