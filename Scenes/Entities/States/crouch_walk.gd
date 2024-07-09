class_name Crouch_walk
extends State

@export var actor: CharacterBody2D

func enter():
	movementManager.SPEED = 30

func exit():
	movementManager.SPEED = movementManager.MAX_SPEED

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
	
	if inputManager.x_inp() == 0 and inputManager.y_inp() == 0:
		Transitioned.emit(self, "idle")
	
	if inputManager.x_inp() != 0 and inputManager.y_inp() == 0:
		Transitioned.emit(self, "run")
	
	if inputManager.jump_inp():
		Transitioned.emit(self, "jump")
	
	if inputManager.x_inp() == 0 and inputManager.y_inp() == 1: # UNIMPLEMENTED
		Transitioned.emit(self, "crouch")
	
	#if InputManager.attack_inp():
		#Transitioned.emit(self, "attack")
	#
	#if Input.is_action_pressed("roll") and actor.roll_cd >= 100:
		#Transitioned.emit(self, "roll")
