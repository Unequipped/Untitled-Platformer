class_name Slide extends PlayerState

@export var end_speed: int = 30

func enter():
	actor.velocity.x *= 2

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_x_decel(movement_manager.x_slide)

func switch_cond():
	if abs(actor.velocity.x) <= end_speed:
		if input_manager.y_inp() > 0:
			state_machine.change_state(&"Crouch")
		
		elif input_manager.y_inp() <= 0 and actor.can_uncrouch():
			state_machine.change_state(&"Idle")

	if input_manager.y_inp() <= 0:
		if actor.can_uncrouch():
			state_machine.change_state(&"Idle")
		else:
			state_machine.change_state(&"Crouch")
