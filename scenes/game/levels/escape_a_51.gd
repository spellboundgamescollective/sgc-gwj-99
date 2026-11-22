extends Node2D

signal level_won

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$TractorBeam.visible = true
	$FinalScene.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func won() -> void:
	level_won.emit()


func _on_final_scene_spaceship_body_entered(body: Node2D) -> void:
	$FinalScene/AnimationPlayer.play("win")
	$PlayerCharacter.set_physics_process(false)	
	$PlayerCharacter.visible = false
	$PlayerCharacter.stop_sounds()
