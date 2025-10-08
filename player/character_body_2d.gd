extends CharacterBody2D

var speed = 300.0
var jump_velocity = -540.0
var blocked = false


func _physics_process(delta: float) -> void:
	if not blocked:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("left", "right") 
		if direction:
			velocity.x = direction * speed
			#if is_on_floor(): 
				#$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.play()
			$AnimatedSprite2D.flip_h = direction < 0
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			if is_on_floor(): 
				$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.play()
			
		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = jump_velocity
			#$AnimatedSprite2D.animation = "jump"

		move_and_slide()
