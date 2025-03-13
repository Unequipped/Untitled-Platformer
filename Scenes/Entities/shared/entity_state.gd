class_name EntityState extends State

@onready var inputManager: LogicManager = null
@onready var movementManager: Movement = null

func attacked():
	Transitioned.emit(self, "hurt")
