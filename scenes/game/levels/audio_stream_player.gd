extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!playing):
		play()
	pass

func _on_wind_section_body_entered(body: Node2D) -> void:
	if(body.name == "PlayerCharacter"):
		if(self.get_stream_playback() != null):
			play()
			self.get_stream_playback().switch_to_clip_by_name(&"wind")
	pass # Replace with function body.

func _on_breeze_section_body_entered(body: Node2D) -> void:
	if(body.name == "PlayerCharacter"):
		if(self.get_stream_playback() != null):
			play()
			self.get_stream_playback().switch_to_clip_by_name(&"breeze")
	pass # Replace with function body.


func _on_breeze_section_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
