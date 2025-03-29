class_name Run extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.x_accel)


func switch_cond():
	if input_manager.x_inp() == 0:
		state_machine.change_state(&"Idle")

	if input_manager.jump_inp():
		state_machine.change_state(&"Jump")
