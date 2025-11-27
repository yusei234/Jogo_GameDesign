extends Control
@onready var menu_select = preload("res://menu/slc_lvl.tscn")
@onready var credits = preload("res://menu/credits.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Exit") :
		get_tree().quit()


func _on_start_button_down() -> void:
	print("Start pressed")
	get_tree().change_scene_to_packed(menu_select)


func _on_quit_button_down() -> void:
	get_tree().quit()


func _on_credits_button_down() -> void:
	get_tree().change_scene_to_packed(credits)
