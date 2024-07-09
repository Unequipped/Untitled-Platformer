extends CanvasLayer

#@onready var health_bar = get_node("Control/ProgressBar")

@export var player_one: CharacterBody2D

@export var p1_hp: ProgressBar
@export var p1_en: ProgressBar

func _ready():
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_one:
		p1_hp.max_value = player_one.hp_comp.MAX_HEALTH
		p1_hp.value = player_one.hp_comp.health
		p1_en.value = player_one.roll_cd

	if p1_hp.value <= 0:
		pass
