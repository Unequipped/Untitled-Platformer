class_name Jump extends PlayerState
## Need to reimplement variable jump height


@export var jump_force = 150
@export var min_jump_dur: int = 10

var jump_dur: int = 0

func enter():
	actor.velocity.y -= jump_force
	jump_dur = 0

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_movement()
	movement_manager.apply_gravity()
	if jump_dur < min_jump_dur:
		jump_dur += 1
	switch_cond()

func switch_cond():
	if actor.is_on_floor() and not actor.velocity.y < 0:
		state_machine.check_switch(&"Idle")

	if !actor.is_on_floor() and actor.velocity.y == 0:
		state_machine.check_switch(&"Fall")
	
	elif input_manager.jump_inp_released() and jump_dur >= min_jump_dur:
		state_machine.check_switch(&"Fall")
