## Scripting for player physics, controls and event triggers.
extends CharacterBody2D

## Constants.
const player_speed:float = 600.0
const jump_velocity:float = 1200

## Variables.
var center_coord:float = 1.0
var rapture_flag:bool = false
var lowgrav_flag:bool = false
@onready var animation_tree:AnimationTree = $AnimationTree
@onready var state_machine:AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
@export var gravity_toggle:bool = true 
@export var gravity_scale:float = 1.0


func _ready() -> void:
	pass
	#idle_animation()

## Player controls & physics.
func _physics_process(delta: float) -> void:
	if lowgrav_flag:
		gravity_scale = 0.5
	else:
		gravity_scale = 1.0
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = -jump_velocity
	if not is_on_floor():
		if(rapture_flag):
			velocity.y = -200
		else:
			velocity += 3 * get_gravity() * delta * gravity_scale

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * player_speed
		#state_machine.travel("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, player_speed)
	
	if velocity.x != 0:
		state_machine.travel("walk")
		
	if direction < 0:
		$Sprite.flip_h = true
	elif direction > 0:
		$Sprite.flip_h = false
	move_and_slide()
	## Debug labels.
	$CanvasLayer/VelocityLabel.text = "Velocity is " + str(velocity)
	$CanvasLayer/GravityLabel.text = "Gravity is " + str(get_gravity()*gravity_scale)
	$CanvasLayer/PositionLabel.text = "Position is " + str(global_position)
	$CanvasLayer/RaptureLabel.text = "Rapture: " + str(rapture_flag)
	$CanvasLayer/LowGravLabel.text = "Low-Grav: " + str(lowgrav_flag)
	print(animation_tree["parameters/sitting/blend_position"])
	#print(state_machine.get_current_node())
	
func idle_animation() -> void:
	pass
	#var rand_dict:Dictionary = {0: -1, 1:1}
	#while true:
		#if state_machine.get_current_node() == "sitting":
	#	var rand_num:int = randi() % 2
	#	state_machine.set("parameters/sitting/blend_position", rand_dict[rand_num])
	#	await get_tree().create_timer(2).timeout
		
## Entering and exiting rapture beam flags.
func _on_rapture_beam_body_entered(body: Node2D) -> void:
	if body == self:
		rapture_flag = true

func _on_rapture_beam_body_exited(body: Node2D) -> void:
	if body == self:
		rapture_flag = false

## Entering and exiting low gravity beam flags.
func _on_low_gravity_body_entered(body: Node2D) -> void:
	if body == self:
		lowgrav_flag = true

func _on_low_gravity_body_exited(body: Node2D) -> void:
	if body == self:
		lowgrav_flag = false

func _on_timer_timeout() -> void:
	print("TIMER")
	var x:int = -0.9
	if randf() < 0.5:
		print("Idling!")
		x = 0.9
	animation_tree.set("parameters/sitting/blend_position", x)
	
