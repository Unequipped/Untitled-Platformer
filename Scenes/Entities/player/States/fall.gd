class_name Fall extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_gravity()
	movement_manager.apply_movement()
	switch_cond()

func switch_cond():
	if actor.is_on_floor():
		state_machine.check_switch(&"Idle")
