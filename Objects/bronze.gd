extends RigidBody2D

@export var id: int = 0
var pressed_button_id = -1

func _ready() -> void:
	Events.connect("button_pressed", _on_button_pressed)
	
func _on_button_pressed(button_id: int):
	if button_id == id:
		$AnimatedSprite2D.show()
		$CollisionShape2D.disabled = false
		$Timer.start(1)
		pressed_button_id = button_id


func _on_timer_timeout() -> void:
	if pressed_button_id == id:
		$AnimatedSprite2D.hide()
		$CollisionShape2D.disabled = true
		pressed_button_id = -1
