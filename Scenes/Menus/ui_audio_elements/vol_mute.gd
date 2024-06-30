extends CheckBox

@export var bus_name: String
var bus_index: int

func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	toggled.connect(_on_toggled)
	
	if button_pressed:
		AudioServer.set_bus_mute(bus_index, true)

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_toggled(button_pressed):
	if button_pressed:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
