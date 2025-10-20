extends CharacterBody2D

var speed = 300.0
var jump_velocity = -540.0
var blocked = false
var kid = true

func _ready() -> void:
	Events.connect("age_changed", _on_age_change)

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

func _on_age_change(new_age):
	print(new_age)
	if new_age == Events.Age.KID:
		$AnimatedSprite2D.scale = Vector2(0.75, 0.65)
		$CollisionShape2D.scale = Vector2(1.0, 1.0)
		jump_velocity = -540.0
		self.kid = true
	else:
		$AnimatedSprite2D.scale = Vector2(1.6, 1.6)
		$CollisionShape2D.scale = Vector2(2.0, 2.0)
		jump_velocity = -810.0
		self.kid = false
