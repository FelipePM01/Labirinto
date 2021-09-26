extends Node

var music_volume = 1
var sound_volume = 1
var jogador = 1
var main_crystal = false
var extra_crystal = false

const passwords = [[0, 3, 2, 1, 2], [0, 2, 1, 3, 0]]

signal sound_volume_changed
signal music_volume_changed
signal music_stopped

func start_game(jogador):
	self.jogador = jogador
	main_crystal = false
	extra_crystal = false

func set_sound_volume(value):
	sound_volume = value
	emit_signal("sound_volume_changed", value)

func set_music_volume(value):
	music_volume = value
	emit_signal("music_volume_changed", value)

func stop_music():
	emit_signal("music_stopped")
