extends Node

@export var countdown_time := 60  # seconds
var time_left := countdown_time
var timer_running := false

signal time_updated(new_time)
signal timer_ended()

func start_timer():
	timer_running = true

func _process(delta):
	if timer_running:
		time_left -= delta
		time_updated.emit(time_left)
		if time_left <= 0:
			time_left = 0
			timer_running = false
			timer_ended.emit()
