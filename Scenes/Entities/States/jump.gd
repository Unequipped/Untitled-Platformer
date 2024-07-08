extends State

@export var actor: CharacterBody2D

@export var jump_force: int = 110

func enter():
	jump_apply()

func exit():
	pass

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()

func switch_state():
	if actor.is_on_floor() and not actor.velocity.y < 0:
		Transitioned.emit(self, "idle")
	
	if actor.velocity.y > 0:
		Transitioned.emit(self, "fall")

func jump_apply():
	actor.velocity.y = -jump_force
