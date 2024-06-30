extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "player":
		print("level end reached")
		get_parent().level_complete()
