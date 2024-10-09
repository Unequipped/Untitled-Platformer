class_name Roll extends PlayerState

@export var actor: CharacterBody2D
@export var end_frame: int = 11
@export var roll_speed: int = 100

func enter(previous_state_path: String = "", data := {}):
	actor.animate(str(name))
	Movement.movable = true
	actor.velocity.x = actor.sprite_pivot.scale.x * roll_speed
	actor.hitbox_comp.monitoring = false

func exit():
	actor.roll_cd = 0
	Movement.movable = false
	actor.hitbox_comp.monitoring = true

func update(delta):
	pass

func physics_update(delta):
	switch_state()

func switch_state():
	if !actor.animator.is_playing():
		if !actor.is_on_floor():
			Transitioned.emit(self, "fall")
		
		if inputManager.x_inp() == 0:
			Transitioned.emit(self, "idle")

		if inputManager.x_inp() != 0:
			Transitioned.emit(self, "run")

func animate():
	pass
