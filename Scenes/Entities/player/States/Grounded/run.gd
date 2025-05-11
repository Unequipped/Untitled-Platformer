class_name Run extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.MAX_SPEED, movement_manager.x_accel)


func switch_cond():
	if input_manager.x_inp() == 0:
		state_machine.change_state(&"Idle")

	elif input_manager.jump_inp():
		state_machine.change_state(&"Jump")
	
	elif movement_manager.can_slide() and input_manager.y_inp() > 0:
		state_machine.change_state(&"Slide")
	
	elif abs(actor.velocity.x) <= 100:
		if !input_manager.run_inp():
			state_machine.change_state(&"Walk")

		if input_manager.y_inp() > 0:
			state_machine.change_state(&"Crouch")
