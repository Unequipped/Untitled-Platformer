class_name InputManager extends LogicManager

#need to rename vars
@export var jump_buffer_timer: float = 0.5
@export var coyote_timer: float = 0.5
var jump_buffer_time: float = 0.0
var coyote_time: float = 0.0


func _input(event):
	if Input.is_action_just_pressed("up"):
		jump_buffer_time = jump_buffer_timer


func _physics_process(delta):
	inc_jump_buffer()


static func x_inp():
	return Input.get_axis("left", "right")


static func y_inp():
	return Input.get_axis("up", "down")


static func attack_inp():
	return Input.is_action_pressed("attack")


static func run_inp():
	return Input.is_action_pressed("run")

func jump_inp():
	return jump_buffer_time > 0 #Input.is_action_just_pressed("up")


func jump_inp_released():
	return !Input.is_action_pressed("up")#jump_release_time > 0


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
	
	if coyote_time >= 0:
		coyote_time -= 0.1
	else:
		coyote_time = 0
