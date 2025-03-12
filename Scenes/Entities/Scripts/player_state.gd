class_name PlayerState extends State

@onready var inputManager: InputManager = null
@onready var movementManager: Movement = null

func attacked():
	Transitioned.emit(self, "hurt")
