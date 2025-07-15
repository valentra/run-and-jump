extends Node
var current_world="main"
var trigger=false

var level_timer := 0.0
var timer_running := false
var best_time := 0.0

func _process(delta):
	if timer_running:
		level_timer += delta

func start_timer():
	level_timer = 0.0
	timer_running = true

func stop_timer():
	timer_running = false
	if best_time == 0.0 or level_timer < best_time:
		best_time = level_timer
		save_best_time()

func save_best_time():
	var file = FileAccess.open("user://best_time.save", FileAccess.WRITE)
	file.store_float(best_time)

func load_best_time():
	if FileAccess.file_exists("user://best_time.save"):
		var file = FileAccess.open("user://best_time.save", FileAccess.READ)
		best_time = file.get_float()
