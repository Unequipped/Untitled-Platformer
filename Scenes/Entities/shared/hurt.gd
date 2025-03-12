extends State

@export var actor: CharacterBody2D

func enter(previous_state_path: String = "", data := {}):
	actor.animate(str(name))

func exit():
	pass

func update(delta):
	actor.animate(str(name)) # THIS NEEDS TO BE UPDATED SO ITS SAFER TO USE
	pass

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")

	if actor.is_on_floor():
		Transitioned.emit(self, "idle")
