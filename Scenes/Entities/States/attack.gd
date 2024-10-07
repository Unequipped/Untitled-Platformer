class_name Attack
extends State

# The issue with attack and attack2 is that I'll probably need to end up
# hard coding apply damage to when the correct frame is reached
# it might be good to create an entirely separate node handling animations

@export var actor: CharacterBody2D
@export var end_frame: int = 3
@export var dmg: int = 5 # remove?

var attack_playing:bool

func enter():
	actor.animate(str(name))

func exit():
	pass

func update(delta):
	attack_playing = actor.animate() # returns true if animation is playing
	if !attack_playing:
		actor.apply_dmg()

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if !attack_playing:
		if inputManager.attack_inp():
			Transitioned.emit(self, "attack2")
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
	
	if inputManager.jump_inp():
		Transitioned.emit(self, "jump")
