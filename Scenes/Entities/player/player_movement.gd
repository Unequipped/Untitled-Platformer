class_name PlayerMovement extends Movement

# movement unique to the player will be described here (?)

@export var crawl_speed: int = 40

@export var x_slide:float = 0.06


func airborne_x_move(target_speed, accel, decel):
	if get_x_dir() != 0:
		apply_x_accel(get_x_dir(), target_speed, accel)
	else:
		apply_x_decel(decel)

func wall_slide(grip):
	actor.velocity.y = grip
