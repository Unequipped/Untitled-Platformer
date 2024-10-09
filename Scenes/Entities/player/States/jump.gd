class_name Jump extends PlayerState

@export var actor: CharacterBody2D
@export var jump_force: int = 110
@export var min_jump_duration:int = 10 # minimum duration for the jump

var jump_duration:int = 0

func enter(previous_state_path: String = "", data := {}):
	jump_apply()
	jump_duration = 0

func exit():
	actor.animate("fall_transition")

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()
	if jump_duration < min_jump_duration:
		jump_duration += 1

func switch_state():
	if actor.is_on_floor() and not actor.velocity.y < 0:
		Transitioned.emit(self, "idle")
	
	if actor.velocity.y >= -45:
		Transitioned.emit(self, "fall")
	
	elif inputManager.jump_inp_released() and jump_duration >= min_jump_duration:
		Transitioned.emit(self, "fall")


func jump_apply():
	actor.velocity.y = -jump_force
