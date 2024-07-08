class_name InputManager
extends Node


static func x_inp():
	return Input.get_axis("left", "right")


static func y_inp():
	return Input.get_axis("up", "down")


static func attack_inp():
	return Input.is_action_pressed("attack")


func get_direction():
	var direction:Vector2 = Vector2.ZERO
	direction.x = x_inp()
	direction.y = y_inp()
	return direction
