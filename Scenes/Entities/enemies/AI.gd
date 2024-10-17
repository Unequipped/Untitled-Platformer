class_name AI extends LogicManager

@export var sight_raycast_R: RayCast2D
@export var sight_raycast_L: RayCast2D

func get_sight():
	if sight_raycast_L.get_collider() != null:
		return -1
	elif sight_raycast_R.get_collider() != null:
		return 1
	else:
		return 0

func get_direction():
	var direction:Vector2 = Vector2.ZERO
	direction.x = get_sight()
	return direction
