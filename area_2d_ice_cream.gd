extends Area2D

@export var item_name = "IceCream" 

var nexttolemons = false;
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D": 
		print("Player hit " + item_name + "!")
		nexttolemons = true;

func _on_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D": 
		print("Player left " + item_name + "!")
		nexttolemons = false;

func _input(event):
	if event.is_action_pressed("ui_accept") && nexttolemons:
		print("Going to pick up " + item_name + "!")
		ObjectiveUi.show_tick(item_name)
