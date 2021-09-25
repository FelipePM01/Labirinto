extends VBoxContainer


func _on_Som_value_changed(value):
	Global.sound_volume = value
	$Audio.play_stored()


func _on_Musica_value_changed(value):
	Global.music_volume = value
	$Audio.play_stored()
