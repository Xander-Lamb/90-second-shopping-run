extends CharacterBody2D

@export var SPEED := 100.0
@export var acceleration := 100.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var animation_direction: String = "Down"
var animation_state: String = ""

func update_sprite_direction(input: Vector2) -> void:
	match input:
		Vector2.DOWN:
			animation_direction = "Down"
		Vector2.UP:
			animation_direction = "Up"
		Vector2.RIGHT:
			animation_direction = "Right"
		Vector2.LEFT:
			animation_direction = "Left"


func update_sprite() -> void:
	if velocity.length() > 0:
		animation_state = "Run_"
	else:
		animation_state = "Idle_"

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	update_sprite_direction(direction)
	update_sprite()
	
	animated_sprite_2d.play(animation_state+animation_direction)
	
	velocity.x = move_toward(velocity.x, direction.x*SPEED, acceleration)
	velocity.y = move_toward(velocity.y, direction.y*SPEED, acceleration)

	move_and_collide(velocity*delta)
	
func _ready():
	SceneManager.scene_changed.connect(_on_scene_changed)
	var current_scene = get_tree().root.get_child(get_tree().root.get_child_count() - 1)
	print("Current scene name: ", current_scene.name)
	if current_scene.name == "Outside_Supermarket":  
		scale = Vector2(0.5, 0.5)
	else:
		scale = Vector2(1, 1)

func _on_scene_changed(_newscene, _oldsceneName):
	var marker_name = "From " + _oldsceneName
	var marker = _newscene.get_node_or_null(marker_name)
	if marker:
		global_position = marker.global_position

var speed = 200  # default speed

func _speed():
	var current_scene = get_tree().current_scene

	if current_scene.name == "Outside_supermarket2":
		scale = Vector2(0.5, 0.5)
		speed = 100  
	else:
		scale = Vector2(1, 1)
		speed = 200 
