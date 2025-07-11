extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -510.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func player():
	pass
	
	
func _physics_process(delta):
	#animation
	if (velocity.x>1||velocity.x<-1):
		sprite_2d.animation="running"
	else:
		sprite_2d.animation="default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation="jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0,10)

	move_and_slide()
	
	var isLeft=velocity.x<0
	sprite_2d.flip_h= isLeft
	
func _input(event):
	if event.is_action_pressed("retry"):
		area_change()
		
func area_change():
	if Global.current_world == "main":
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	elif Global.current_world == "world_2":
		get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	elif Global.current_world == "world_3":
		get_tree().change_scene_to_file("res://scenes/world__3.tscn")
	elif Global.current_world == "world_4":
		get_tree().change_scene_to_file("res://scenes/world_4.tscn")
#func _on_interaction_area_body_entered(body):
	#if body.has_method("check"):
		#get_tree().change_scene_to_file("res://scenes/world_2.tscn")
