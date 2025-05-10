class_name Animator extends Node

@export var animated_sprite: AnimatedSprite2D
@export var state_machine: StateMachine

var state_to_animate: State

func play_animation(anim_name: String, speed: float = 1):
	if anim_name == "WallKick":
		anim_name = "Jump"
	animated_sprite.play(anim_name, speed)

func get_current_state():
	return state_machine.current_state

func _process(delta):
	if state_to_animate:
		play_animation(state_to_animate.name)

func _physics_process(delta):
	state_to_animate = get_current_state()
