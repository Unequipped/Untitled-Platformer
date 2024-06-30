extends Control

@onready var slider = $VBoxContainer/HBoxContainer/HSlider
@onready var volume_label = $VBoxContainer/HBoxContainer/volume_label

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	volume_label.text = str(slider.value)
