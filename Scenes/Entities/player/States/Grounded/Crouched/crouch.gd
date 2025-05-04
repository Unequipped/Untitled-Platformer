class_name Crouch extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_x_decel(movement_manager.x_decel) #could have a stronger decel here?

func switch_cond():
	if input_manager.x_inp() != 0:
		state_machine.change_state(&"CrouchWalk")
	
	# you don't need to check if you've released 'down', the macrostate can check for that!
