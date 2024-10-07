class_name Attack
extends State

@export var actor: CharacterBody2D
@export var end_frame: int = 3
@export var dmg: int = 5 # remove?

var attack_playing:bool

func enter():
	actor.animate(str(name))

func exit():
	actor.apply_dmg()

func update(delta):
	attack_playing = actor.animate() # returns true if animation is playing

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if !attack_playing:
		if inputManager.attack_inp():
			Transitioned.emit(self, "attack2")
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
