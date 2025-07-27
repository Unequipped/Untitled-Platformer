class_name EGrounded extends EnemyState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func switch_cond():
	if !actor.is_on_floor():
		state_machine.change_state(&"EFall")

func default_switch():
	state_machine.change_state(&"EIdle")
