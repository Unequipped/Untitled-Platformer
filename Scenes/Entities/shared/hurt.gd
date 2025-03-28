class_name Hurt extends PlayerState

@onready var timer: Timer = $Timer
@export var actor: CharacterBody2D

func enter(_previous_state_path: String = "", _data := {}):
	actor.animate(str(name))
	timer.start()
	print("ok")

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	if timer.is_stopped():
		switch_state() # only transition after finishing animation

func switch_state():
	if actor.is_on_floor():
		Transitioned.emit(self, "idle")
	
	if !actor.is_on_floor():
		Transitioned.emit(self, "fall")
