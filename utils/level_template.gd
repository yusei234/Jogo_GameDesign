extends Node

@export var base_resolution := Vector2(1920, 1080)

var player

func _ready() -> void:
	Events.connect("victory", _on_victory)
	Events.connect("restart", _on_restart)
	Events.connect("fall", _on_restart)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().change_scene_to_packed(load(get_tree().current_scene.scene_file_path))
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_packed(load("res://menu/slc_lvl.tscn"))
	
func _on_victory():
	$Victory.show()
	print("Victory")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(load("res://menu/Victory.tscn"))
	
func _on_restart():
	get_tree().change_scene_to_packed(load(get_tree().current_scene.scene_file_path))
