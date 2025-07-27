class_name ERun extends EnemyState

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
	
	elif abs(actor.velocity.x) <= 100:
		if !input_manager.run_inp():
			state_machine.change_state(&"Walk")
