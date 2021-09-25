extends "res://Button.gd"

export(Array, Texture) var neutral_textures
export(Array, Texture) var pressed_textures
var current_color = 0
var id = 0
signal color_changed

func next_color():
	current_color = (current_color + 1) % len(neutral_textures)
	texture_normal = neutral_textures[current_color]
	texture_pressed = pressed_textures[current_color]
	emit_signal("color_changed", id, current_color)
