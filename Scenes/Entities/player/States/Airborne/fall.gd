class_name Fall extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func switch_cond():
	if actor.is_on_floor() and input_manager.x_inp() != 0:
		state_machine.change_state(&"Run")
	
	if actor.is_on_wall() and actor.get_last_slide_collision():
		if actor.get_last_slide_collision().get_normal().x == -input_manager.x_inp():
			state_machine.change_state(&"WallSlide")
