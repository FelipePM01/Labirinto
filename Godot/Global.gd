extends Node

var music_volume = 1
var sound_volume = 1
var jogador = 1

signal sound_volume_changed
signal music_volume_changed

func set_sound_volume(value):
	sound_volume = value
	emit_signal("sound_volume_changed", value)

func set_music_volume(value):
	music_volume = value
	emit_signal("music_volume_changed", value)
