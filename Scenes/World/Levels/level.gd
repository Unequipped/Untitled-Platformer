extends Node2D

@onready var Game = get_parent()
@onready var loaded_player = preload("res://Scenes/Entities/player/player.tscn").instantiate()
@onready var hud = preload("res://Scenes/Menus/hud.tscn").instantiate()
@onready var spawn_point = get_node("spawn_point")

func _ready():
	self.call_deferred("add_child", loaded_player)#self.get_node("dungeonTileSet").call_deferred("add_child", loaded_player)
	self.call_deferred("add_child", hud)
	loaded_player.position = spawn_point.position

func level_complete():
	if self.name == "level_1":
		Game._add_scene(Game.level_2_scene)
	elif self.name == "level_2":
		Game._add_scene(Game.level_3_scene)
	elif self.name == "level_3":
		Game._add_scene(Game.level_4_scene)
	elif self.name == "level_4":
		Game._add_scene(Game.level_5_scene)
	elif self.name == "level_5":
		Game._add_scene(Game.level_6_scene)
	elif self.name == "level_6":
		Game._add_scene(Game.level_7_scene)
	elif self.name == "level_7":
		reset_game()
	queue_free()

func reset_game():
	Game._add_scene(Game.main_menu_scene)
