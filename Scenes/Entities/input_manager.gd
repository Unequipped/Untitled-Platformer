class_name InputManager
extends Node

#need to rename vars
@export var jump_buffer_timer: float = 0.5
var jump_buffer_time: float = 0.0
@export var jump_release_timer: float = 100
var jump_release_time: float = 0.0

func _input(event):
	if Input.is_action_just_pressed("up"):
		jump_buffer_time = jump_buffer_timer
	elif Input.is_action_just_released("up"):
		jump_release_time = jump_release_timer


func _physics_process(delta):
	inc_jump_buffer()
	inc_jump_release()


static func x_inp():
	return Input.get_axis("left", "right")


static func y_inp():
	return Input.get_axis("up", "down")


static func attack_inp():
	return Input.is_action_pressed("attack")


func jump_inp():
	return jump_buffer_time > 0 #Input.is_action_just_pressed("up")


func jump_inp_released():
	return jump_release_time < 0


func get_direction():
	var direction:Vector2 = Vector2.ZERO
	direction.x = x_inp()
	direction.y = y_inp()
	return direction


func inc_jump_buffer():
	if jump_buffer_time >= 0:
		jump_buffer_time -= 0.1
	else:
		jump_buffer_time = 0

func inc_jump_release():
	if jump_release_time >= 0:
		jump_release_time -= 0.1
	else:
		jump_release_time = 0
