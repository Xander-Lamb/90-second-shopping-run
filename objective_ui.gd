extends Node

@onready var canvas = $CanvasLayer

func _ready():
	update_visibility()

func update_visibility():
	var current_scene = get_tree().current_scene
	if current_scene == null:
		return

	var scene_name = current_scene.name
	var hidden_scenes = ["StartScreen", "ObjectiveScreen"]

	if scene_name in hidden_scenes:
		self.visible = false
	else:
		self.visible = true
