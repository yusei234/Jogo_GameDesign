extends Control
@onready var lvl1_select = preload("res://level/level1.tscn")
@onready var lvl2_select = preload("res://level/level2.tscn")
@onready var lvl3_select = preload("res://level/level3.tscn")
@onready var lvl4_select = preload("res://level/level4.tscn")
@onready var lvl5_select = preload("res://level/level5.tscn")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Exit"):
		get_tree().change_scene_to_packed(load("res://menu/menu.tscn"))

func _on_lvl_2_button_down() -> void:
	get_tree().change_scene_to_packed(lvl2_select)

func _on_lvl_3_button_down() -> void:
	get_tree().change_scene_to_packed(lvl3_select)

func _on_lvl_4_button_down() -> void:
	get_tree().change_scene_to_packed(lvl4_select)

func _on_lvl_5_button_down() -> void:
	get_tree().change_scene_to_packed(lvl5_select)

func _on_lv_1_button_down() -> void:
	get_tree().change_scene_to_packed(lvl1_select)


func _on_menu_button_down() -> void:
	get_tree().change_scene_to_packed(load("res://menu/menu.tscn"))
