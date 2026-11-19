extends CharacterBody2D


const SPEED:float = 600.0
const TERMINAL_VELOCITY:float = 1000
var charge_jump_velocity:float = 0.0
var jump_velocity:float = 1200
var center_coord:float = 1.0 
var jump_counter:int = 0

@export var gravity_toggle:bool = true
@export var gravity_scale:float = 1.0

func _physics_process(delta: float) -> void:
	#if gravity_toggle == true:
		#var distance_from_center_scale:float =  clampf(1-abs(1/global_position.x), 0.01, 1.0)
		#print("Scale: " + str(distance_from_center_scale) + " | Position: " + str(position))
		#print(str(jump_velocity))
		# Add the gravity.
	#	if not is_on_floor():
	#		velocity += 3 * get_gravity() * delta * gravity_scale
		
			
	#if Input.is_action_just_pressed("up") and jump_counter < 1:
	#	jump_counter += 1
	#	velocity.y = -jump_velocity
	
	#if Input.is_action_pressed("up") and jump_counter == 1:
	#	charge_jump_velocity = clampf(charge_jump_velocity + 20, 0, jump_velocity)
	#	gravity_toggle = false
		
	#if Input.is_action_just_released("up") and jump_counter == 1:
	#	velocity.y = -jump_velocity 
	#	gravity_toggle = true

	#if is_on_floor() and jump_counter > 0:
	#	jump_counter = 0
			
		#if is_on_floor():
			## CHARGE JUMP	
			#if Input.is_action_pressed("up"):
				#	
			# Handle jump.
			#if Input.is_action_just_released("up"):
			#	velocity.y = charge_jump_velocity 
			#	charge_jump_velocity = 0
			#if Input.is_action_pressed("up"):
			#	velocity.y = -jump_velocity
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump_velocity
	if not is_on_floor():
		if(gravity_scale == 0):
			velocity.y = -200
		else:
			velocity += 3 * get_gravity() * delta * gravity_scale
			
	var charge_label:Label = get_node("CanvasLayer/ChargeLabel")
	charge_label.text = "Charged velocity is " + str(-charge_jump_velocity)
	$CanvasLayer/ChargeLabel.text = "Charged velocity is " + str(-charge_jump_velocity)
	$CanvasLayer/VelocityLabel.text = "Velocity is " + str(velocity)
	$CanvasLayer/GravityLabel.text = "Gravity is " + str(get_gravity()*gravity_scale)
	$CanvasLayer/PositionLabel.text = "Position is " + str(global_position)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_reduced_grav_hit_box_body_entered(body: Node2D) -> void:
	gravity_scale = 0.8


func _on_reduced_grav_hit_box_body_exited(body: Node2D) -> void:
	gravity_scale = 1.0


func _on_beam_hit_box_body_entered(body: Node2D) -> void:
	gravity_scale = 0 


func _on_beam_hit_box_body_exited(body: Node2D) -> void:
	gravity_scale = 0.8
