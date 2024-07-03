class_name Attack
extends State

@export var actor: CharacterBody2D
@export var end_frame: int = 3

var attack_playing:bool

func enter():
	attack_playing = true
	actor.velocity.x = 0

func exit():
	pass

func update(delta):
	if actor.animator.frame < end_frame:
		attack_playing = actor.animate(str(name)) # THIS NEEDS TO BE UPDATED SO ITS SAFER TO USE
	else:
		attack_playing = false

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if InputManager.attack_inp() and !attack_playing and actor.is_on_floor():
			Transitioned.emit(self, "attack2")
	
	elif !attack_playing:
		Transitioned.emit(self, "idle")

	elif !InputManager.attack_inp() and !attack_playing:
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
