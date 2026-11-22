extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_low_gravity_body_entered(body: Node2D) -> void:
	play()
	if((body.name == "PlayerCharacter") && (self.get_stream_playback() != null)):
		self.get_stream_playback().switch_to_clip_by_name(&"A")
	pass # Replace with function body.


func _on_low_gravity_body_exited(body: Node2D) -> void:
	if(body.name == "PlayerCharacter"):
		stop()
	pass # Replace with function body.


func _on_rapture_beam_body_entered(body: Node2D) -> void:
	if(body.name == "PlayerCharacter"):
		self.get_stream_playback().switch_to_clip_by_name(&"C")
	pass # Replace with function body.


func _on_rapture_beam_body_exited(body: Node2D) -> void:
	if(body.name == "PlayerCharacter"):
		self.get_stream_playback().switch_to_clip_by_name(&"B")
	pass # Replace with function body.


func _on_rapture_cusp_body_entered(body: Node2D) -> void:
	if((body.name == "PlayerCharacter") && (self.get_stream_playback() != null)):
		self.get_stream_playback().switch_to_clip_by_name(&"B")
	pass # Replace with function body.


func _on_rapture_cusp_body_exited(body: Node2D) -> void:
	if((body.name == "PlayerCharacter") && (self.get_stream_playback() != null)):
		self.get_stream_playback().switch_to_clip_by_name(&"A")
	pass # Replace with function body.
