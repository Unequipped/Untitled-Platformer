class_name Grounded extends PlayerState

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
		state_machine.check_switch(&"Fall")
