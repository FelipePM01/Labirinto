extends AudioStreamPlayer

export(bool) var is_music = false

func play_stored():
	playing = true
	if is_music:
		volume_db = linear2db(Global.music_volume)
	else:
		volume_db = linear2db(Global.sound_volume)
