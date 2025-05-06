class_name WallSlide extends PlayerState

@export var y_friction: int = 10
@export var wall_kick_force: int = 100

func enter():
	actor.velocity.x = 0

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.y_movement(y_friction)
	movement_manager.x_movement(movement_manager.MAX_SPEED, movement_manager.x_air_decel)
	# you need the above so that you can 'move' into the wall and hence trigger is_on_wall() as true
	# need to keep an eye on this in case it causes issues in the future

func switch_cond():
	if input_manager.jump_inp():
		if actor.get_last_slide_collision() != null:
			actor.velocity.x = wall_kick_force * (actor.get_last_slide_collision().get_normal()).x
			state_machine.change_state(&"Jump")
	
	if actor.get_last_slide_collision():
		if actor.get_last_slide_collision().get_normal().x != -input_manager.x_inp():
			state_machine.change_state(&"Fall")
	
	if actor.is_on_floor():
		state_machine.change_state(&"Idle")
