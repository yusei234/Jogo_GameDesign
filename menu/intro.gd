extends Node2D

var liste_images
var index = -1
var menu = preload("res://menu/menu.tscn")

func _ready() -> void:
	liste_images = [$First,$Second,$Third, $Forth]

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Space") :
		index +=1
		if index > 3 :
			get_tree().change_scene_to_packed(menu)
			return
		liste_images[index].show()
