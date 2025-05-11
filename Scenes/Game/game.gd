extends Node

@onready var main_menu_scene = preload("res://Scenes/Menus/main_menu.tscn")
@onready var settings_scene = preload("res://Scenes/Menus/settings.tscn")
@onready var TEST_OAK = preload("res://Scenes/World/Levels/smooth_world.tscn")

var game_state:int = 0
var current_level:Object
var hud: Object

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _add_scene(scene_to_add):
	current_level = scene_to_add.instantiate()
	call_deferred("add_child", current_level) #imperative to have .instantiate() here instead of preload
