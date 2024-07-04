class_name RollTwo
extends State

@export var actor: CharacterBody2D
@export var end_frame: int = 11

func enter():
	MovementTwo.rolling = true
	actor.velocity.x = actor.sprite_pivot.scale.x *100
	actor.hitbox_comp.monitoring = false

func exit():
	actor.roll_cd = 0
	MovementTwo.rolling = false
	actor.hitbox_comp.monitoring = true

func update(delta):
	actor.animate(str(name))

func physics_update(delta):
	if actor.animator.frame < end_frame:
		pass
	else:
		switch_state()

func switch_state():
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
	
	if InputManagerTwo.x_inp() == 0:
		Transitioned.emit(self, "idle")

	if InputManagerTwo.x_inp() != 0:
		Transitioned.emit(self, "run")

func animate():
	pass
