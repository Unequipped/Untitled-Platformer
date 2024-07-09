extends CanvasLayer

#@onready var health_bar = get_node("Control/ProgressBar")

@export var player_one: CharacterBody2D

@export var p1_hp: ProgressBar
@export var p1_en: ProgressBar

@export var input_section: Control

@export var w_key: TextureButton
@export var a_key: TextureButton
@export var s_key: TextureButton
@export var d_key: TextureButton

@export var vis_btn: Button

func _ready():
	visible = true


func _input(event):
	if event.is_action_pressed("escape"):
		visible = !visible


func _process(delta):
	if player_one:
		p1_hp.max_value = player_one.hp_comp.MAX_HEALTH
		p1_hp.value = player_one.hp_comp.health
		p1_en.value = player_one.roll_cd

	key_press_display()


func key_press_display(): # there is probably a better way of doing this but it works for now
	w_key.button_pressed = false
	a_key.button_pressed = false
	s_key.button_pressed = false
	d_key.button_pressed = false
	if Input.is_action_pressed("up"):
		w_key.button_pressed = true
	if Input.is_action_pressed("left"):
		a_key.button_pressed = true
	if Input.is_action_pressed("down"):
		s_key.button_pressed = true
	if Input.is_action_pressed("right"):
		d_key.button_pressed = true


func _on_button_pressed():
	input_section.visible = !input_section.visible
