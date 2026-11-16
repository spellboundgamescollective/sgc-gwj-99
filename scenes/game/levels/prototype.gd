extends Node2D

signal level_lost

const TERMINAL_VELOCITY:float = 2000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if $PlayerCharacter.velocity.y >= TERMINAL_VELOCITY:
		print("LEVEL LOST")
		level_lost.emit()
