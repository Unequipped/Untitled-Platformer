class_name Falling extends PlayerState

@export var actor: CharacterBody2D

func enter(previous_state_path: String = "", data := {}):
	if previous_state_path == "jump": # intended for some roll over instead of abrupt
		actor.velocity.y = -45 # hard-coded approach - will need to change in future

func exit():
	pass

func update(delta):
	actor.animate(str(name), "fall_transition")

func physics_update(delta):
	switch_state()

func switch_state():
	if actor.is_on_floor():
		Transitioned.emit(self, "idle")

	if actor.is_on_floor() and Input.get_axis("left", "right") != 0:
		Transitioned.emit(self, "run")
