extends CanvasLayer

@onready var canvas = $CanvasLayer

func _ready():
	_update_visibility()
	SceneManager.scene_changed.connect(_on_scene_changed)

func _update_visibility():
	var current_scene = get_tree().current_scene
	if current_scene == null:
		return

	var scene_name = current_scene.name
	var hidden_scenes = ["Main Menu", "Objective Screen"]
	print(scene_name)

	if scene_name in hidden_scenes:
		self.visible = false
	else:
		self.visible = true

func _on_scene_changed(_scene):
	await get_tree().create_timer(0.01).timeout
	_update_visibility()
