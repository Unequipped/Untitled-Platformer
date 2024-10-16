class_name AI extends LogicManager

@export var sight_raycast_R: RayCast2D
@export var sight_raycast_L: RayCast2D

func get_direction():
	if sight_raycast_L.get_collider() != null:
		return Vector2.LEFT
	elif sight_raycast_R.get_collider() != null:
		return Vector2.RIGHT
	else:
		return Vector2.ZERO
