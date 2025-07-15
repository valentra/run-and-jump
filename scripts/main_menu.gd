extends Control

func _ready():
	Global.load_best_time()
	var best = int(Global.best_time)
	var minutes = best / 60
	var seconds = best % 60
	$VBoxContainer/BestTimeLabel.text = "Best Time: %02d:%02d" % [minutes, seconds]



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/main.tscn")


func _on_exit_pressed():
	get_tree().quit()
