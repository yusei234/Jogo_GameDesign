extends Node2D

@export var id:int = 0
var body_inside = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	body_inside = true
	Events.emit_signal("button_pressed", id)
	$AnimatedSprite2D.animation = "pressed"


func _on_area_2d_body_exited(body: Node2D) -> void:
	body_inside = false
	Events.emit_signal("button_unpressed", id)
	$AnimatedSprite2D.animation = "default"
