extends Node

var visible: bool = true

func _ready():
	Events.connect("time_changed", _on_time_change)
	
func _on_time_change(new_value):
	if new_value == Events.Times.PRESENT:
		$AnimatedSprite2D.hide()
		$CollisionShape2D.disabled = true
	elif new_value == Events.Times.PAST:
		$AnimatedSprite2D.show()
		$CollisionShape2D.disabled = false
