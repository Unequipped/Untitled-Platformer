class_name EWalk extends EnemyState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.walk_speed, movement_manager.x_accel)


func switch_cond():
	if input_manager.x_inp() == 0:
		state_machine.change_state(&"EIdle")
