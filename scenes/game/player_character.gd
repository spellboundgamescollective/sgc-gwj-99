extends CharacterBody2D


const SPEED:float = 300.0
@export var max_jump_velocity:int  = 800
var jump_velocity:int = 0

func _physics_process(delta: float) -> void:
	print(str(jump_velocity))
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		if Input.is_action_pressed("up"):
			jump_velocity = clampi(jump_velocity - 20, -max_jump_velocity, 0)
		# Handle jump.
		if Input.is_action_just_released("up"):
			velocity.y = jump_velocity 
			jump_velocity = 0.0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
