extends StaticBody2D

@onready var sprite_2d = $Sprite2D

func checka():
	$Sprite2D.play("default")
#func check():
	#sprite_2d.animation="default"

var change=false

func _on_area_2d_body_entered(body):
	if body.has_method("player") :
		change= true
		
	
func _input(event):
	if change and event.is_action_pressed("interact"):
		area_change()
			
func area_change():
	change = false
	if Global.current_world == "main":
		Global.current_world = "world_2"
		get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	elif Global.current_world == "world_2":
		Global.current_world = "world_3"
		get_tree().change_scene_to_file("res://scenes/world__3.tscn")
	elif Global.current_world == "world_3":
		Global.current_world = "world_4"
		get_tree().change_scene_to_file("res://scenes/world_4.tscn")
	elif Global.current_world == "world_4":
		Global.current_world = "main"
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
