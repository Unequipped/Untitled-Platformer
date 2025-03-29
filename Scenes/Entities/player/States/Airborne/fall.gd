class_name Fall extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.x_decel)
	movement_manager.apply_gravity()


func switch_cond():
	if actor.is_on_floor():
		state_machine.change_state(&"Idle")
