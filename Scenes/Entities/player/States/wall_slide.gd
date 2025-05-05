class_name WallSlide extends PlayerState

@export var y_friction: int = 10

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.y_movement(y_friction)

func switch_cond():
	if input_manager.jump_inp():
		state_machine.change_state(&"Jump")
	
	if actor.is_on_floor():
		state_machine.change_state(&"Idle")
