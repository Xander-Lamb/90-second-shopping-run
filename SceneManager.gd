extends Node

signal scene_changed(new_scene: Node)

var changedFromSceneName = ""

func change_scene(scene_path: String):
	changedFromSceneName = get_tree().current_scene.name
	print("Changing from scene " + changedFromSceneName + " to scene from file: ", scene_path)
	var error = get_tree().change_scene_to_file(scene_path)
	if error != OK:
		print("Failed to change scene: ", error)
		return
	# Connect to tree_changed to wait for the scene to be fully loaded
	get_tree().tree_changed.connect(_on_tree_changed, CONNECT_ONE_SHOT)

func _on_tree_changed():
	# Wait one more frame to ensure current_scene is updated
	call_deferred("_emit_scene_changed")

func _emit_scene_changed():
	emit_signal("scene_changed", get_tree().current_scene, changedFromSceneName)
