extends Node

func _ready():
	Events.connect("time_changed", _on_time_change)
	
func _on_time_change(new_value):
	if new_value == Events.Times.PRESENT:
		$AnimatedSprite2D.show()
		if (find_child("CollisionPolygon2D")):
			$CollisionPolygon2D.disabled = false
		else:
			$CollisionShape2D.disabled = false
	elif new_value == Events.Times.PAST:
		$AnimatedSprite2D.hide()
		if (find_child("CollisionPolygon2D")):
			$CollisionPolygon2D.disabled = true
		else:
			$CollisionShape2D.disabled = true
