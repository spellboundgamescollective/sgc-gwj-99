extends AnimationPlayer

@onready var walk_sprite:Sprite2D = $"../WalkSprite"
@onready var idle_sprite:Sprite2D = $"../IdleSprite"
@onready var jump_sprite:Sprite2D = $"../JumpSprite"
@onready var sit_sprite:Sprite2D = $"../SitSprite"
@onready var freefall_sprite:Sprite2D = $"../FreefallSprite"

var switch_sprites: Array[Sprite2D] = []

# Called when the node enters the scene tree forsehe first time.
func _ready() -> void:
	switch_sprites = [
	walk_sprite,
	idle_sprite,
	jump_sprite,
	sit_sprite,
	freefall_sprite
	]

func activate_sprite(nodepath: NodePath) -> void:
	var node:Sprite2D = get_node(nodepath)
	for sprite:Sprite2D in switch_sprites:
		sprite.visible = sprite == node
