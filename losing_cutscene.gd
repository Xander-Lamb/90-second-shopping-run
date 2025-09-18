extends Node

@onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("Husband_Walk")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Husband_Walk": 
		get_tree().quit()
