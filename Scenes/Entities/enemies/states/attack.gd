class_name EAttack extends EnemyState

@export var actor: CharacterBody2D

var attack_playing:bool

func enter(previous_state_path: String = "", data := {}):
	actor.animate(str(name))

func exit():
	pass

func update(delta):
	attack_playing = actor.animate() # returns true if animation is playing
	if !attack_playing:
		pass #actor.apply_dmg()

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if !attack_playing:
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
