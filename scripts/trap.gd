extends Area2D

func _on_body_entered(body):
	if body.has_method("player") :
		call_deferred("_restart_scene")

func _restart_scene():
		get_tree().reload_current_scene()
