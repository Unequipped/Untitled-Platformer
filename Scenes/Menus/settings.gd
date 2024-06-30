extends CanvasLayer

@onready var mm_button = get_node("Control/VBoxContainer/mm_button")
@onready var Game = get_parent()

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	pass
	
	if Game.current_level != null:
		if Game.current_level.name == "main_menu":
			mm_button.hide()
		else:
			mm_button.show()
	else:
		mm_button.hide()
	
	activate_settings_ui()

func _on_back_button_button_up():
	self.hide()
	get_tree().paused = false

func _on_exit_button_button_up():
	get_tree().quit()

func _on_mm_button_button_up():
	get_tree().paused = false
	if Game.current_level != null:
		Game.current_level.queue_free()
		Game._add_scene(Game.main_menu_scene)
		self.hide()

func activate_settings_ui():
	if Input.is_action_just_pressed("escape"):
		if self.visible:
			self.hide()
			get_tree().paused = false
		else:
			self.show()
			get_tree().paused = true
