extends RigidBody2D

const speed = 200

var direction = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	var target_velocity = direction * speed
	apply_central_impulse(target_velocity * delta)

func _on_body_entered(body: Node2D) -> void:
	if (body is CharacterBody2D and !body.kid):
		print("Enter")
		var new_value = 1 if body.faced_direction == "right" else -1
		direction = Vector2(new_value, 0)


func _on_area_2d_body_exited(body: Node2D) -> void:
	direction = Vector2(0, 0)
