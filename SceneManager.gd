extends Node

signal scene_changed(new_scene: Node)

func change_scene(scene_path: String):
	print("Changing to scene: ", scene_path)
	var error = get_tree().change_scene_to_file(scene_path)
	if error != OK:
		print("Failed to change scene: ", error)
		return
	call_deferred("_emit_scene_changed")

func _emit_scene_changed():
	emit_signal("scene_changed", get_tree().current_scene)
