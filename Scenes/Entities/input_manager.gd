class_name InputManager
extends Node

static func x_inp():
	return Input.get_axis("left", "right")

static func y_inp():
	var y_dir:int = 0
	if Input.is_action_pressed("up"):
		y_dir = -1
	elif Input.is_action_pressed("down"):
		pass
	return y_dir

static func attack_inp():
	return Input.is_action_pressed("attack")

func get_direction():
	var direction:Vector2 = Vector2.ZERO
	direction.x = x_inp()
	direction.y = y_inp()
	return direction
