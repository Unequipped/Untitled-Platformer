extends Node

@onready var main_menu_scene = preload("res://Scenes/Menus/main_menu.tscn")
@onready var settings_scene = preload("res://Scenes/Menus/settings.tscn")
@onready var level_1_scene = preload("res://Scenes/World/Levels/level_1.tscn")
@onready var level_2_scene = preload("res://Scenes/World/Levels/level_2.tscn")
@onready var level_3_scene = preload("res://Scenes/World/Levels/level_3.tscn")
@onready var level_4_scene = preload("res://Scenes/World/Levels/level_4.tscn")
@onready var level_5_scene = preload("res://Scenes/World/Levels/level_5.tscn")
@onready var level_6_scene = preload("res://Scenes/World/Levels/level_6.tscn")
@onready var level_7_scene = preload("res://Scenes/World/Levels/level_7.tscn")
@onready var level_X_scene = preload("res://Scenes/World/Levels/level_template.tscn")
#@onready var pass = preload("res://Scenes/.tscn").instantiate()

var game_state:int = 0
var current_level:Object

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _add_scene(scene_to_add):
	current_level = scene_to_add.instantiate()
	call_deferred("add_child", current_level) #imperative to have .instantiate() here instead of preload

