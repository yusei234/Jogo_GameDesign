extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not CharacterBody2D:
		pass
	print("Coin collected!")
	print(body)
	Events.emit_signal("coin_collected")
	queue_free()
