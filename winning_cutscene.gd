extends Node

@onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("new_animation")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "new_animation": 
		get_tree().change_scene_to_file("res://cut_scene_no_pay.tscn")
