extends StaticBody2D
@export var collision_shape:Shape2D
@export_file var texture_path:String="res://icon.svg"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture=load(texture_path)
	$CollisionShape2D.shape=collision_shape
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
