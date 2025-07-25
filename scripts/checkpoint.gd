extends StaticBody2D

@onready var sprite_2d = $Sprite2D
#checkpoint animation
func checka():
	$Sprite2D.play("default")

#func _ready():
	#if Global.current_world == "main":
		#Global.level_timer = 0

var change=false

func _on_area_2d_body_entered(body):
	if body.has_method("player") :
		change= true
		
	
func _input(event):
	if change and event.is_action_pressed("interact"):
		area_change()
		

var level_order = [
	"main",
	"world_2",
	"world_3",
	"world_4",
	"world_5",
	"world_6"
]

var level_paths = {
	"main": "res://scenes/levels/world_2.tscn",
	"world_2": "res://scenes/levels/world__3.tscn",
	"world_3": "res://scenes/levels/world_4.tscn",
	"world_4": "res://scenes/levels/world_5.tscn",
	"world_5": "res://scenes/levels/world_6.tscn",
	"world_6": "res://scenes/levels/main_menu.tscn"
}

func area_change():
	change = false
	var current_index = level_order.find(Global.current_world)
	if current_index != -1:
		var next_index = (current_index + 1) % (level_order.size())
		print(next_index)
		var next_world = level_order[next_index]
		var next_scene_path = level_paths.get(Global.current_world, "")
		if next_scene_path != "":
			call_deferred("_change_scene_and_update_world", next_scene_path, next_world)
		else:
			print("Scene path not found for:", Global.current_world)
	else:
		print("Current world not found in level_order:", Global.current_world)

func _change_scene_and_update_world(scene_path: String, new_world: String):
	if Global.current_world == "world_6":
		Global.stop_timer()
	Global.current_world = new_world
	print(Global.current_world)
	get_tree().change_scene_to_file(scene_path)



