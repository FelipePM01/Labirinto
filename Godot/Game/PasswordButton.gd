extends "res://Button.gd"

var neutral_textures
var pressed_textures
var current_color = 0
var id = 0
signal color_changed

func _ready():
	connect('button_up', self, 'next_color')

func next_color():
	current_color = (current_color + 1) % len(neutral_textures)
	texture_normal = neutral_textures[current_color]
	texture_pressed = pressed_textures[current_color]
	emit_signal("color_changed", id, current_color)
