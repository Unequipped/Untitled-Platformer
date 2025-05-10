class_name Grounded extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	if actor.is_on_floor():
		input_manager.coyote_time = input_manager.coyote_timer

func switch_cond():
	if !actor.is_on_floor():
		state_machine.change_state(&"Fall")

func default_switch():
	state_machine.change_state(&"Idle")
