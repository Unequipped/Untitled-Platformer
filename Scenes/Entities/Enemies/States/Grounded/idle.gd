class_name EIdle extends EnemyState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_x_decel(movement_manager.x_decel)

func switch_cond():
	if input_manager.x_inp() != 0:
		state_machine.change_state(&"EWalk")
