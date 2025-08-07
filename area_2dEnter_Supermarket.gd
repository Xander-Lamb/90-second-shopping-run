extends Area2D


var entered = false

func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true


func _on_body_exited(body: CharacterBody2D) -> void:
	entered = true


func _process(delta):
	if entered == true:
		SceneManager.change_scene("res://Super_market.tscn")
