class_name Fall extends PlayerState

func enter():
	pass

func exit():
	actor.velocity.y = 0 # this is needed to allow coyote jump to be strong enough

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.MAX_SPEED, movement_manager.x_air_decel)

func switch_cond():
	if actor.is_on_floor() and input_manager.x_inp() != 0:
		state_machine.change_state(&"Run")
	
	if !actor.is_on_floor() and input_manager.jump_inp() and input_manager.coyote_time > 0:
		state_machine.change_state(&"Jump")
	
	if actor.is_on_wall() and actor.get_last_slide_collision():
		if actor.get_last_slide_collision().get_normal().x == -input_manager.x_inp():
			state_machine.change_state(&"WallSlide")
