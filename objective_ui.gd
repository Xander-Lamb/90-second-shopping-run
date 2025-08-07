extends CanvasLayer

const numberOfItemsRequired = 3
var numberOfItemsCollected = 0

func _ready():
	update_visibility()
	SceneManager.scene_changed.connect(_on_scene_changed)

func update_visibility():
	var current_scene = get_tree().current_scene
	if current_scene == null:
		return
	var scene_name = current_scene.name
	var hidden_scenes = ["Main Menu", "Objective Screen", "Game Over", "VictoryScene"]
	print(scene_name)
	if scene_name in hidden_scenes:
		self.visible = false
	else:
		self.visible = true

func _on_scene_changed(_newscene, _oldsceneName):
	await get_tree().create_timer(0.01).timeout
	update_visibility()

func show_tick(_symbol):
	print("Going to show tick for " + _symbol)
	# Find the Label and its TextureRect tick
	var label_path = "Panel/" + _symbol + "Tick"
	var label = get_node(label_path)
	if label:
		label.visible = true
		print(_symbol + " tick shown!")
		numberOfItemsCollected = numberOfItemsCollected + 1

func _is_complete():
	return numberOfItemsCollected == numberOfItemsRequired
	
