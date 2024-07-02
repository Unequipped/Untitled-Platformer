class_name Attack
extends State

@export var actor: CharacterBody2D

var attack_playing:bool

func enter():
	attack_playing = false
	#actor.animator.set_autoplay(false)

func exit():
	pass
	#actor.animator.set_autoplay(true)

func update(delta):
	attack_playing = actor.animate(str(name)) # THIS NEEDS TO BE UPDATED SO ITS SAFER TO USE

func physics_update(delta):
	switch_state()

func switch_state():
	if !InputManager.attack_inp():
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
