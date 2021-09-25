extends AudioStreamPlayer

export(bool) var is_music = false

func _ready():
	if is_music:
		volume_db = linear2db(Global.music_volume)
		Global.connect("music_volume_changed", self, "change_volume")
		Global.connect("music_stopped", self, "stop_music")
	else:
		volume_db = linear2db(Global.sound_volume)
		Global.connect("sound_volume_changed", self, "change_volume")

func change_volume(value):
	volume_db = linear2db(value)


func play_music():
	stop_music()
	play()


func stop_music():
	playing = false
