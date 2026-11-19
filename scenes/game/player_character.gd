## Scripting for player physics, controls and event triggers.
extends CharacterBody2D


## Constants.
const player_speed:float = 600.0
const jump_velocity:float = 1200

## Variables.
var center_coord:float = 1.0
var rapture_flag:bool = false
var lowgrav_flag:bool = false
var monitoring:bool = true
@export var gravity_toggle:bool = true
@export var gravity_scale:float = 1.0

## Player controls & physics.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump_velocity
	if not is_on_floor():
		#if(rapture_flag):
		#	velocity.y = -200
		#else:
		velocity += 3 * get_gravity() * delta * gravity_scale

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * player_speed
	else:
		velocity.x = move_toward(velocity.x, 0, player_speed)
	move_and_slide()

	## Debug labels.
	var charge_label:Label = get_node("CanvasLayer/ChargeLabel")
	$CanvasLayer/VelocityLabel.text = "Velocity is " + str(velocity)
	$CanvasLayer/GravityLabel.text = "Gravity is " + str(get_gravity()*gravity_scale)
	$CanvasLayer/PositionLabel.text = "Position is " + str(global_position)
	$CanvasLayer/RaptureLabel.text = "Rapture: " + str(rapture_flag)
	$CanvasLayer/LowGravLabel.text = "Low-Grav: " + str(rapture_flag)

## Entering and exiting rapture beam flags.
func _on_rapture_beam_area_entered(area: Area2D) -> void:
	rapture_flag = true
func _on_rapture_beam_area_exited(area: Area2D) -> void:
	rapture_flag = false

## Entering and exiting low gravity beam flags.
func _on_low_gravity_area_entered(area: Area2D) -> void:
	lowgrav_flag = true
func _on_low_gravity_area_exited(area: Area2D) -> void:
	lowgrav_flag = false
