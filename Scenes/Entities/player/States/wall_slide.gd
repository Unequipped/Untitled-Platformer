class_name WallSlide extends PlayerState
## Wall Slide is neither Grounded nor Airborne
## Might be worth creating new category called "Walled" ?

@export var y_friction: int = 10
@export var wall_kick_force: int = 100
@export var wall_slide_duration: int = 10

var wall_slide_time: int = 0
var last_collision

func enter():
	wall_slide_time = wall_slide_duration
	last_collision = actor.get_last_slide_collision()

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	print(wall_slide_time)
	if !is_moving_in_to_wall():
		buffered_is_on_wall()
	movement_manager.y_movement(y_friction)
	movement_manager.x_movement(movement_manager.MAX_SPEED, 1)
	# you need the above so that you can 'move' into the wall and hence trigger is_on_wall() as true
	# need to keep an eye on this in case it causes issues in the future

func buffered_is_on_wall():
	wall_slide_time -= 1
	return wall_slide_time > 0

func is_moving_in_to_wall():
	if last_collision.get_normal().x == -input_manager.x_inp() and actor.is_on_wall():
		return true
	elif input_manager.x_inp() == 0:
		return false
	elif (last_collision.get_normal().x == input_manager.x_inp()):
		wall_slide_time = 0
		return false
	elif (last_collision.get_normal().x == -input_manager.x_inp()) and !actor.is_on_wall():
		wall_slide_time = 0
		return false

func switch_cond():
	if actor.is_on_wall():
		if input_manager.jump_inp():
			actor.velocity.x = wall_kick_force * (last_collision.get_normal()).x
			state_machine.change_state(&"WallKick")
	if wall_slide_time <= 0:
		state_machine.change_state(&"Fall")
	
	if actor.is_on_floor():
		state_machine.change_state(&"Idle")
