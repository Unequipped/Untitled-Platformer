class_name Airborne extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_gravity()

func switch_cond():
	if actor.is_on_floor() and not actor.velocity.y < 0 and input_manager.x_inp() == 0:
		state_machine.change_state(&"Idle")

func default_switch():
	state_machine.change_state(&"Fall")
