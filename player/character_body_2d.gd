extends CharacterBody2D

var speed = 300.0
var jump_velocity = -540.0
var blocked = false
var kid = true
var faced_direction = "right"
var idade = "bebe"

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
			faced_direction =  "left" if direction < 0 else "right" 
			velocity.x = direction * speed
			if is_on_floor(): 
				$AnimatedSprite2D.animation = idade + "_walk_" + faced_direction
			else:
				$AnimatedSprite2D.animation = idade + "_jump_" + faced_direction
			$AnimatedSprite2D.play()
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			if is_on_floor(): 
				$AnimatedSprite2D.animation = idade + "_idle_" + faced_direction
			$AnimatedSprite2D.play()
			
		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = jump_velocity
			$AnimatedSprite2D.animation = idade + "_jump_" + faced_direction

		move_and_slide()

func _on_age_change(new_age):
	print(new_age)
	if new_age == Events.Age.KID:
		$CollisionShape2D.scale = Vector2(1.0, 1.0)
		jump_velocity = -540.0
		speed = 300.0
		idade = "bebe"
		self.kid = true
	else:
		$CollisionShape2D.scale = Vector2(1.5, 1.5)
		jump_velocity = -810.0
		speed = 200.0
		idade = "idoso"
		self.kid = false
