class_name Fall extends PlayerState

func enter():
	pass

func exit():
	pass

func update(_delta) -> void:
	pass

func physics_update(_delta) -> void:
	movement_manager.apply_gravity()


func switch_cond():
	pass
