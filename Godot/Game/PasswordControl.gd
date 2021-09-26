extends Node

export(Array, Texture) var neutral_textures
export(Array, Texture) var pressed_textures
export(Array, NodePath) var crystals

var current_password = [0, 0, 0, 0, 0]
signal victory

func _ready():
	var id = 0
	for crystal in crystals:
		var node = get_node(crystal)
		node.id = id
		node.neutral_textures = neutral_textures
		node.pressed_textures = pressed_textures
		id += 1

func color_changed(id, color):
	current_password[id] = color
	if current_password == Global.passwords[Global.jogador -1]:
		emit_signal("victory")
