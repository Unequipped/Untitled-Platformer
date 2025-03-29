class_name Crouch extends PlayerState

func enter():
	actor.crouch_collision(true)
	pass

func exit():
	actor.crouch_collision(false)
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.crawl_speed, movement_manager.x_accel)

func switch_cond():
	if actor.can_uncrouch():
		if input_manager.y_inp() <= 0:
			state_machine.change_state(&"Idle")
