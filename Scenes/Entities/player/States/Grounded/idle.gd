class_name Idle extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_x_deccel(movement_manager.x_decel)

func switch_cond():
	if !actor.is_on_floor():
		state_machine.check_switch(&"Fall")
	
	if input_manager.x_inp() != 0:
		state_machine.check_switch(&"Run")
	
	if input_manager.jump_inp():
		state_machine.check_switch(&"Jump")
