extends Node2D

func _on_body_entered(body: Node2D) -> void:
	if (body is CharacterBody2D and !body.kid):
		print("Breaking block!")
		print(body)
		Events.emit_signal("block_break")
		queue_free()
