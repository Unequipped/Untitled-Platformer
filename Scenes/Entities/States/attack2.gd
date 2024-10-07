class_name Attack2
extends State

@export var actor: CharacterBody2D
@export var end_frame: int = 5

var attack_playing:bool

func enter():
	actor.animate(str(name))

func exit():
	actor.apply_dmg()

func update(delta):
	attack_playing = actor.animate()

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if !attack_playing:
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
		else:
			Transitioned.emit(self, "fall")
