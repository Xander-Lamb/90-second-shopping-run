extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed() -> void:
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_in")
	await $Fade_transition/Fade_timer.timeout
	
	SceneManager.change_scene("res://Objective_screen.tscn")

func _on_options_pressed() -> void:
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_in")
	await $Fade_transition/Fade_timer.timeout
	
	SceneManager.change_scene("res://Options_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
