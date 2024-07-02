class_name State
extends Node

@export var animation_name: String
@export var move_speed: float = 400

@export var gravity: int = 110

var parent: CharacterBody2D

func enter():
	pass
	#parent.animations.play(animation_name)

func exit():
	pass

func process_input(event: InputEvent):
	return null

func process_frame(delta):
	return null

func process_physics(delta):
	return null

 
