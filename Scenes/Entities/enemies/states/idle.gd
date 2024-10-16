class_name EIdle extends EnemyState

@export var actor: CharacterBody2D

func enter(previous_state_path: String = "", data := {}):
	pass

func exit():
	pass

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	switch_state()

func switch_state():
	if inputManager.get_direction() != Vector2.ZERO:
		Transitioned.emit(self, "run")
