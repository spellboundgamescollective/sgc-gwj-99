extends CharacterBody2D


const SPEED:float = 300.0
var jump_velocity:float = 100.0

# -45, -40

func _physics_process(delta: float) -> void:
	var tween:Tween = create_tween()
	print(str(jump_velocity))
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		if Input.is_action_pressed("up"):
			jump_velocity = clampi(jump_velocity - 20.0, -800, 0)
			#tween.tween_property($ChargeMeter, "position", Vector2(-48.0, -40), 0.67)
			
		# Handle jump.
		if Input.is_action_just_released("up"):
			velocity.y = jump_velocity 
			jump_velocity = 0
	var label:Label = get_node("CanvasLayer/Label")
	label.text = "Charged velocity is " + str(-jump_velocity)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
