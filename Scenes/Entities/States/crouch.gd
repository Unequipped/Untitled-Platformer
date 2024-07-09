class_name Crouch
extends State

@export var actor: CharacterBody2D

func enter():
	actor.animate(str(name)) # didn't know I could do this for attacking...

func exit():
	pass

func update(delta):
	actor.animate()

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
	
	if inputManager.x_inp() != 0 and inputManager.y_inp() == 1: # UNIMPLEMENTED
		Transitioned.emit(self, "crouch_walk")
	
	#if InputManager.attack_inp():
		#Transitioned.emit(self, "attack")
	#
	#if Input.is_action_pressed("roll") and actor.roll_cd >= 100:
		#Transitioned.emit(self, "roll")
