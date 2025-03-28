class_name Jump extends PlayerState

@export var jump_force = 150

func enter():
	actor.velocity.y -= jump_force

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_movement()
	switch_cond()

func switch_cond():
	if !actor.is_on_floor():
		state_machine.check_switch(&"Fall")
