extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_packed(load("res://menu/menu.tscn"))


func _on_button_button_down() -> void:
	get_tree().change_scene_to_packed(load("res://menu/menu.tscn"))
