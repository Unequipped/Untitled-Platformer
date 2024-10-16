class_name EHurt extends PlayerState

@export var actor: CharacterBody2D

func enter(_previous_state_path: String = "", _data := {}):
	actor.animate(str(name))

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	if actor.animate(str(name), str(name)) == false:
		switch_state()

func switch_state():
	if actor.is_on_floor():
		Transitioned.emit(self, "idle")
	
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")

	if inputManager.x_inp() != 0:
		Transitioned.emit(self, "run")

	if inputManager.attack_inp():
		Transitioned.emit(self, "attack")

	if Input.is_action_pressed("roll") and actor.roll_cd >= 100:
		Transitioned.emit(self, "roll")
