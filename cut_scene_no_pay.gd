extends Node

@onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("Bouncer_run")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Bouncer_run": 
		get_tree().quit()
