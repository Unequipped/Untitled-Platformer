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

func can_attack():
	var right:= 100
	var left:= 100
	if sight_raycast_L.get_collider() != null:
		left = abs(get_parent().global_position - sight_raycast_L.get_collider().position).x
	if sight_raycast_R.get_collider() != null:
		right = abs(get_parent().global_position - sight_raycast_R.get_collider().position).x
	if right <= 10 or left <= 10:
			return true
	return false

func _process(delta): # just using this for testing
	pass
