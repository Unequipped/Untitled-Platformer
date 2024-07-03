class_name IdleTwo
extends State

@export var actor: CharacterBody2D

func enter():
	pass

func exit():
	pass

func update(delta):
	actor.animate(str(name)) # THIS NEEDS TO BE UPDATED SO ITS SAFER TO USE

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")

	if InputManagerTwo.x_inp() != 0:
		Transitioned.emit(self, "run")

	if Input.is_action_pressed("up_2"):
		Transitioned.emit(self, "jump")

	if InputManagerTwo.attack_inp():
		Transitioned.emit(self, "attack")

	if Input.is_action_pressed("roll_2") and actor.roll_cd >= 100:
		Transitioned.emit(self, "roll")
