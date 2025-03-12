extends Area2D

func look_for_target(target: String, value):
	#print(get_overlapping_bodies())
	for body in get_overlapping_bodies():
		if body.name == target:
			body.apply_damage(value)
		else:
			pass
