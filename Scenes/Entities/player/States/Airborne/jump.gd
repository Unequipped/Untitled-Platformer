class_name Jump extends PlayerState

@export var jump_force = 150
@export var min_jump_dur: int = 10
@export var run_over_vel: int = -45
## The remaining 'run over' velocity after releasing jump
# a run off velocity of 0 results in a very abrupt fall

var jump_dur: int = 0
var end_early: bool = false

func enter():
	actor.velocity.y -= jump_force
	jump_dur = 0
	end_early = false

func exit():
	if end_early:
		actor.velocity.y = run_over_vel # still could be better way of handling this

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.x_movement(movement_manager.MAX_SPEED, movement_manager.x_air_decel)
	if jump_dur < min_jump_dur:
		jump_dur += 1

func switch_cond():
	if !actor.is_on_floor() and actor.velocity.y >= run_over_vel:
		state_machine.change_state(&"Fall")
	
	elif input_manager.jump_inp_released() and jump_dur >= min_jump_dur:
		end_early = true
		state_machine.change_state(&"Fall")
