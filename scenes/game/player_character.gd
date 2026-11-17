extends CharacterBody2D


const SPEED:float = 300.0
const TERMINAL_VELOCITY:float = 1000
var jump_velocity:float = 0.0
var center_coord:float = 960
@export var physics_toggle:bool = true


func _physics_process(delta: float) -> void:
	if physics_toggle == true:
		var distance_from_center_scale:float =  abs(position.x/center_coord)
		#print("Scale: " + str(distance_from_center_scale) + " | Position: " + str(position))
		#print(str(jump_velocity))
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta * distance_from_center_scale
		if is_on_floor():
			if Input.is_action_pressed("up"):
				jump_velocity = clampi(jump_velocity - 20.0, -800, 0)
				#tween.tween_property($ChargeMeter, "position", Vector2(-48.0, -40), 0.67)
	
			# Handle jump.
			if Input.is_action_just_released("up"):
				velocity.y = jump_velocity 
				jump_velocity = 0
		var charge_label:Label = get_node("CanvasLayer/ChargeLabel")
		charge_label.text = "Charged velocity is " + str(-jump_velocity)

		$CanvasLayer/VelocityLabel.text = "Velocity is " + str(velocity)
		$CanvasLayer/GravityLabel.text = "Gravity is " + str(get_gravity()*distance_from_center_scale)
	
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction:float = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
