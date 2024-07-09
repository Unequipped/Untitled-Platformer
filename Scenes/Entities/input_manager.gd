class_name InputManager
extends Node

#need to rename vars
@export var jump_buffer_timer: float = 0.5
var jump_buffer_time: float = 0.0

func _input(event):
	if Input.is_action_just_pressed("up"):
		jump_buffer_time = jump_buffer_timer

func _physics_process(delta):
	if jump_buffer_time > jump_buffer_timer:
		jump_buffer_time -= 1
	print(jump_buffer_time)

static func x_inp():
	return Input.get_axis("left", "right")


static func y_inp():
	return Input.get_axis("up", "down")


static func attack_inp():
	return Input.is_action_pressed("attack")


static func jump_inp():
	return Input.is_action_just_pressed("up") #jump_buffer_time > 0 #Input.is_action_just_pressed("up")


func get_direction():
	var direction:Vector2 = Vector2.ZERO
	direction.x = x_inp()
	direction.y = y_inp()
	return direction
