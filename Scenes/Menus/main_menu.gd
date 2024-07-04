extends Control

@onready var Game = get_parent()

func _ready():
	pass
	
func _process(_delta):
	pass

func _on_start_button_button_up():
	#get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
	Game._add_scene(Game.level_X_scene)
	queue_free()

func _on_options_button_button_up():
	get_parent().get_node("settings_ui").show()

func _on_exit_button_pressed():
	get_tree().quit()
