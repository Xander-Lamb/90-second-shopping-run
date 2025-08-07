extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_in")

func _on_options_pressed() -> void:
	button_type = "options"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_in")
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		#get_tree().change_scene_to_file("res://Objective_screen.tscn")
		SceneManager.change_scene("res://Objective_screen.tscn")
		
	elif button_type == "options" :
			#get_tree().change_scene_to_file("res://Options_menu.tscn")
			SceneManager.change_scene("res://Options_menu.tscn")
