class_name Enemy extends Entity

# Movement related stuff 
var vel: Vector2 = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta: float):
	move_and_slide()

func _process(delta: float):
	pass
