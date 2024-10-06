class_name Crouch
extends State

@export var actor: CharacterBody2D

func enter():
	actor.animate("crouch_transition", "crouch_walk") # didn't know I could do this for attacking...
	# the issue with the above is that if you transition from crouch walk to crouch the animation plays
	# passing a value into enter that dictates whether an animation plays or not could be used to fix this
	actor.crouch_collision(true)

func exit():
	actor.crouch_collision(false)
	actor.animate("crouch_transition", "", true)

func update(delta):
	actor.animate(str(name), "crouch_transition")

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
	
	if actor.can_uncrouch():
		if inputManager.y_inp() <= 0:
			if inputManager.x_inp() == 0:
				Transitioned.emit(self, "idle")

			elif inputManager.x_inp() != 0:
				Transitioned.emit(self, "run")
		
		if inputManager.jump_inp():
			Transitioned.emit(self, "jump")
		
	if inputManager.x_inp() != 0 and (inputManager.y_inp() == 1 or !actor.can_uncrouch()):
		Transitioned.emit(self, "crouch_walk")
