extends CanvasLayer

@export var start_time: int = 60
@export var game_over_scene: String = "res://GameOverScene.tscn"  # Replace with your own

var time_left: int = 0
var countdown_timer: Timer

func _ready():
	time_left = start_time
	update_label()
	start_countdown()

func start_countdown():
	countdown_timer = Timer.new()
	countdown_timer.wait_time = 1
	countdown_timer.one_shot = false
	countdown_timer.autostart = true
	countdown_timer.timeout.connect(_on_timer_tick.bind())
func _on_timer_tick():
	time_left -= 1
	update_label()
	
	if time_left <= 0:
		countdown_timer.stop()
		get_tree().change_scene_to_file(game_over_scene)

func update_label():
	$TimerLabel.text = "⏱️ %d" % time_left
