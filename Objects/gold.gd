extends RigidBody2D

@export var id: int = 0

func _ready() -> void:
	Events.connect("button_pressed", _on_button_pressed)
	Events.connect("button_unpressed", _on_button_unpressed)
	
func _on_button_pressed(button_id: int):
	if button_id == id:
		$AnimatedSprite2D.hide()
		$CollisionShape2D.disabled = true
		
func _on_button_unpressed(button_id: int):
	if button_id == id:
		print("unpressed")
		$Timer.start(3)


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.show()
	$CollisionShape2D.disabled = false
