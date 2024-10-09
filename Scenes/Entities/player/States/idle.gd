class_name Idle extends PlayerState

@export var actor: CharacterBody2D

func enter(previous_state_path: String = "", data := {}):
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

	if inputManager.x_inp() != 0:
		Transitioned.emit(self, "run")

	if inputManager.jump_inp():
		Transitioned.emit(self, "jump")

	if inputManager.attack_inp():
		Transitioned.emit(self, "attack")

	if Input.is_action_pressed("roll") and actor.roll_cd >= 100:
		Transitioned.emit(self, "roll")
	
	if inputManager.y_inp() == 1:
		Transitioned.emit(self, "crouch")
