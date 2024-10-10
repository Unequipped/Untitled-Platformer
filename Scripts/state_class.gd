class_name State extends Node

signal Transitioned

func enter(previous_state_path: String = "", data := {}) -> void:
	pass

func exit() -> void:
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass

func switch_state():
	pass
