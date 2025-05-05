class_name WallSlide extends PlayerState

@export var y_friction: int = 10
@export var wall_kick_force: int = 100

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
		if actor.get_last_slide_collision() != null:
			actor.velocity.x = wall_kick_force * (actor.get_last_slide_collision().get_normal()).x
			state_machine.change_state(&"Jump")
	
	if actor.is_on_floor():
		state_machine.change_state(&"Idle")
