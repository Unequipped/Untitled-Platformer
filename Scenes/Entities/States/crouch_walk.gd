class_name Crouch_walk
extends State

@export var actor: CharacterBody2D

func enter():
	movementManager.SPEED = 30
	actor.crouch_collision(true)

func exit():
	movementManager.SPEED = movementManager.MAX_SPEED
	actor.crouch_collision(false)

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
	
	if actor.can_uncrouch():
		if inputManager.x_inp() == 0:
			if inputManager.y_inp() == 0:
				Transitioned.emit(self, "idle")

			elif inputManager.y_inp() == 1:
				Transitioned.emit(self, "crouch")
	
		elif inputManager.x_inp() != 0 and inputManager.y_inp() == 0:
			Transitioned.emit(self, "run")
	
		if inputManager.jump_inp():
			Transitioned.emit(self, "jump")
