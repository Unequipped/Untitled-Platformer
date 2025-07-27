class_name EFall extends EnemyState

func enter():
	pass

func exit():
	actor.velocity.y = 0 # this is needed to allow coyote jump to be strong enough

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func switch_cond():
	if actor.is_on_floor() and input_manager.x_inp() != 0:
			state_machine.change_state(&"EWalk")
