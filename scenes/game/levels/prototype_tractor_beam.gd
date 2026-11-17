extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_beam_hit_box_body_entered(body: Node2D) -> void:
	$BeamHitBox/CollisionShape2D.debug_color = Color("eb405567")


func _on_beam_hit_box_body_exited(body: Node2D) -> void:
	$BeamHitBox/CollisionShape2D.debug_color = Color("0099b36b")
