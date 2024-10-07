extends Camera2D

@export var actor: Player

@onready var default_offset: Vector2 = offset
@onready var parent_position: Vector2

func _ready():
	default_offset = offset


func _process(delta):
	pass
	#parent_position = actor.position
	#position.y = 20
	#if actor.is_on_floor():
		#position.y = actor.position.y #global_position.y = get_target_position().y # get_screen_center_position().y #get_target_position()
		##align()
		##print("aligned") #position = actor.global_position - default_offset
