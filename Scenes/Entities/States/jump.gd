extends State

@export var actor: CharacterBody2D
@export var jump_force: int = 110
@export var min_jump_duration:int = 10 # minimum duration for the jump

var jump_duration:int = 0

func enter():
	jump_apply()
	jump_duration = 0

func exit():
	pass

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()
	if jump_duration < min_jump_duration:
		print(jump_duration)
		jump_duration += 1

func switch_state():
	if actor.is_on_floor() and not actor.velocity.y < 0:
		Transitioned.emit(self, "idle")
	
	if actor.velocity.y > 0:
		Transitioned.emit(self, "fall")
	
	elif inputManager.jump_inp_released() and jump_duration >= min_jump_duration:
		Transitioned.emit(self, "fall") #The main issue with this is the sudden vel cut off (can only be fixed by rewriting part of the state script)


func jump_apply():
	actor.velocity.y = -jump_force
