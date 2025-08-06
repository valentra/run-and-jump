extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -510.0
@onready var sprite_2d = $Sprite2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func player():
	pass
	
	
func _physics_process(delta):
	
	if (velocity.x>1||velocity.x<-1):
		sprite_2d.animation="running"
	else:
		sprite_2d.animation="default"
	
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation="jumping"

	
	if Input.is_action_just_pressed("jump")and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
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
		get_tree().reload_current_scene()
		
	
func _ready():
	if Global.current_world == "main" && Global.timer_running==false: 
			Global.start_timer()


func _process(_delta):
	if Global.timer_running:
		var t = int(Global.level_timer)
		var m = t / 60
		var sec = t % 60
		$HUDLayer/TimerLabel.text = "Time: %02d:%02d" % [m, sec]
