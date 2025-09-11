extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D": # Adjust to match your player's node name
		print("Player is going to give wife groceries!")
		if ObjectiveUi._is_complete():
			print("Objective complete, now loading victory scene")
			SceneManager.change_scene("res://Winning_Cutscene.tscn")
		
