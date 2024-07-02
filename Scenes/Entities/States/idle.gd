class_name Idle
extends State

@export var actor: CharacterBody2D

func enter():
	pass

func exit():
	pass

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
	if InputManager.x_inp() != 0:
		Transitioned.emit(self, "run")
	if Input.is_action_pressed("up"):
		Transitioned.emit(self, "jump")
