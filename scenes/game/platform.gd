@tool

extends StaticBody2D
@export var collision_shape:Shape2D
@export_file var texture_path:String="res://icon.svg"

func _on_editor_state_changed() -> void:
	print("Editor state changed")
	$Sprite2D.texture=load(texture_path)
	$CollisionShape2D.shape=collision_shape
