extends Node2D

@export var next_scene_path: String = "res://Outside_supermarket2.tscn"
@export var delay_seconds: float = 4.0

func _ready():
	await get_tree().create_timer(delay_seconds).timeout
	
	var fade = $Fade_transition 
	fade.show()

	var fade_timer = fade.get_node("Fade_timer")
	var anim_player = fade.get_node("AnimationPlayer")
	
	anim_player.play("Fade_in")
	fade_timer.start()

	await fade_timer.timeout

	get_tree().change_scene_to_file(next_scene_path)
