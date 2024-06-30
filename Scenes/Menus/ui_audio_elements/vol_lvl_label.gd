extends Label

@export var bus_name: String
var bus_index: int

func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)

func _process(delta):
	update_txt()

func update_txt() -> void:
	var value = round(db_to_linear(AudioServer.get_bus_volume_db(bus_index))*100)
	text = str(value)
