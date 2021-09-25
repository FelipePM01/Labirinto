extends VBoxContainer


func _on_Som_value_changed(value):
	Global.set_sound_volume(value)
	$Audio.play()


func _on_Musica_value_changed(value):
	Global.set_music_volume(value)
	$Audio.play()
