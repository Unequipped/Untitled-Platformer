class_name WallKick extends PlayerState

@export var jump_force = 150

func enter():
	actor.velocity.y -= jump_force

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func switch_cond():
	if input_manager.jump_inp_released() or actor.velocity.y >= 0:
		state_machine.change_state(&"Fall")
	
	if actor.is_on_wall() and actor.get_last_slide_collision():
		if actor.get_last_slide_collision().get_normal().x == -input_manager.x_inp():
			state_machine.change_state(&"WallSlide")
