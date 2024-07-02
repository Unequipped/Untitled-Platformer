extends State
class_name Idle

@export var actor: CharacterBody2D

func enter():
	pass

func exit():
	pass

func update(delta):
	pass

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
