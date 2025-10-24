extends Node

var player

#For now the nodes are placeholder, will need to be modified when the corresponding work is done

func _ready() -> void:
	Events.connect("victory", _on_victory)
	Events.connect("restart", _on_restart)
	Events.connect("fall", _on_restart)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene_to_packed(load(get_tree().current_scene.scene_file_path))
	
func _on_victory():
	$Victory.show()
	print("Victory")
	get_tree().change_scene_to_packed(load(get_tree().current_scene.scene_file_path))
	
func _on_restart():
	get_tree().change_scene_to_packed(load(get_tree().current_scene.scene_file_path))
