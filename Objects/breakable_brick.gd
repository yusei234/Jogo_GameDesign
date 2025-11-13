extends Node2D

var is_breaking: bool = false

func _on_body_entered(body: Node2D) -> void:
	if (body is CharacterBody2D and !body.kid):
		print("Breaking block!")
		print(body)
		Events.emit_signal("block_break")
		$AnimatedSprite2D.animation = "breaking"
		$Timer.start(0.1)
		



func _on_timer_timeout() -> void:
	if (is_breaking):
		queue_free()
	else:
		is_breaking = true
		$AnimatedSprite2D.animation = "broke"
		$Timer.start(0.1)
