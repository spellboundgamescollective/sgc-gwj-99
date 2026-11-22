extends AudioStreamPlayer

var sat_long:bool = false
var play_delay:float = 0

@export var single_audio: AudioStream
@export var random_audio: AudioStreamRandomizer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = random_audio
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	play_delay += delta
	if((stream == single_audio && !playing) || (play_delay > 5)):
		play()
		play_delay = 0
	pass

func _on_player_character_sat_down() -> void:
	if(sat_long == true):
		sat_long = false
		stream = random_audio
	set_process(true)
	pass # Replace with function body.


func _on_player_character_stood_up() -> void:
	set_process(false)
	stop()
	pass # Replace with function body.


func _on_player_character_sat_long() -> void:
	if(sat_long == false):
		sat_long = true
		stream = single_audio
	pass # Replace with function body.
