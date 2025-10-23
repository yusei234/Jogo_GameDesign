extends RigidBody2D

const speed = 200

var direction_moved = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	var target_velocity = direction_moved * speed
	apply_central_impulse(target_velocity * delta)

func _on_body_entered(body: Node2D) -> void:
	if (body is CharacterBody2D and !body.kid):
		print("Enter")
		var direction := Input.get_axis("left", "right") 
		if direction:
			var new_value = direction
			direction_moved = Vector2(new_value, 0)


func _on_area_2d_body_exited(body: Node2D) -> void:
	direction_moved = Vector2(0, 0)
