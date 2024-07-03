class_name Falling
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
	if actor.is_on_floor():
		Transitioned.emit(self, "idle")

	if actor.is_on_floor() and Input.get_axis("left_2", "right_2") != 0:
		Transitioned.emit(self, "run")
