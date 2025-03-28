class_name Run extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.x_accel)
	switch_cond()

func switch_cond():
	if !actor.is_on_floor():
		state_machine.check_switch(&"Fall")
	
	if input_manager.x_inp() == 0:
		state_machine.check_switch(&"Idle")

	if input_manager.jump_inp():
		state_machine.check_switch(&"Jump")
