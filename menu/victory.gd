extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Space") && visible:
		get_tree().change_scene_to_packed(load("res://menu/slc_lvl.tscn"))


func _on_retour_lvl_slct_button_down() -> void:
	get_tree().change_scene_to_packed(load("res://menu/slc_lvl.tscn"))
