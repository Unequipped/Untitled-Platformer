class_name EAttack extends EnemyState

@export var actor: CharacterBody2D
@export var attack_frame_index: int = 4

var attack_playing: bool
var attack_is_done: bool = false

func enter(previous_state_path: String = "", data := {}):
	actor.animate(str(name))
	attack_is_done = false

func exit():
	pass

func update(delta):
	attack_playing = actor.animate() # returns true if animation is playing
	if actor.animator.frame == attack_frame_index and !attack_is_done:
		print("HIT")
		attack_is_done = true

func physics_update(delta):
	actor.velocity.x = 0
	switch_state()

func switch_state():
	if !attack_playing:
		if actor.is_on_floor():
			Transitioned.emit(self, "idle")
		else:
			Transitioned.emit(self, "fall")
