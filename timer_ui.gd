extends CanvasLayer

var time_left := 60.0
var timer_active := false
@onready var label = get_node("Panel/Label")

func _ready():
	_update_visibility()
	SceneManager.scene_changed.connect(_on_scene_changed)

func _process(delta):
	if timer_active and time_left > 0:
		time_left -= delta
		label.text = "TIME REMAINING: " + str(round(time_left))
	elif timer_active and time_left <= 0:
		timer_active = false
		#get_tree().change_scene_to_file("res://Losing_Cutscene.tscn")
		SceneManager.change_scene("res://Losing_Cutscene.tscn")

func _on_scene_changed(_newscene, _oldsceneName):
	await get_tree().create_timer(0.01).timeout
	_update_visibility()

func _update_visibility():
	var scene_name = get_tree().current_scene.name

	if scene_name == "Main Menu" or scene_name == "Objective Screen" or scene_name == "Options Menu" or scene_name == "Game Over" or scene_name == "VictoryScene" or scene_name == "CutSceneLose" or scene_name == "CutSceneWin":
		hide()
		time_left = 60.0
		timer_active = false
	else:
		show()
		#Starting the timer when outside supermarket
		if scene_name == "Outside_Supermarket":
			timer_active = true
