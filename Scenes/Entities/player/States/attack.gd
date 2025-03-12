class_name Attack extends PlayerState

# The issue with attack and attack2 is that I'll probably need to end up
# hard coding apply damage to when the correct frame is reached
# it might be good to create an entirely separate node handling animations

@export var actor: CharacterBody2D
@export var dmg_frame: int = 1
@export var dmg: int = 5 # UNUSED - can be used to give attacks unique dmg

var attack_playing:bool

func enter(previous_state_path: String = "", data := {}):
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
			#Transitioned.emit(self, "attack2") removed to simplify attack
			Transitioned.emit(self, "attack")
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
	
	if inputManager.jump_inp():
		Transitioned.emit(self, "jump")
