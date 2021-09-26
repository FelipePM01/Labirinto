extends Node2D

export(Array, Texture) var pressed_textures
export(Array, NodePath) var crystals

# Called when the node enters the scene tree for the first time.
func _ready():
	var i = 0
	for digit in Global.passwords[2-Global.jogador]:
		get_node(crystals[i]).texture = pressed_textures[digit]
		i += 1
