extends State

@export var actor: CharacterBody2D
@export var y_accel: int = 1
@export var y_max: int = 200

func enter():
	pass

func exit():
	pass

func update(delta):
	pass

func physics_update(delta):
	apply_gravity()
	switch_state()

func switch_state():
	if actor.is_on_floor():
		Transitioned.emit(self, "idle")

func apply_gravity():
	if actor.velocity.y < y_max:
		actor.velocity.y += y_accel
	elif actor.velocity.y >= y_max:
		actor.velocity.y = y_max
