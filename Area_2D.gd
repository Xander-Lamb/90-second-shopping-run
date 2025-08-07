extends Area2D


var entered = false

func _on_Area2D_body_entered(body) -> void:
	print("body entered")
	if body.name == "CharacterBody2D":
		entered = true


func _on_Area2D_body_exited(body) -> void:
	entered = false
	
	
func _process(delta):
	if entered == true:
		#get_tree().change_scene_to_file("res://Ice_cream_shop.tscn")
		SceneManager.change_scene("res://Ice_cream_shop.tscn")
