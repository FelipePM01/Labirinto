extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	connect('hide', self, 'reset_bright')
	connect('mouse_entered', self, 'set_bright')
	connect('mouse_exited', self, 'reset_bright')
	connect('button_up', self, 'emit_sound')
	modulate = Color(0.75, 0.75, 0.75, 1)


func emit_sound():
	if $Audio:
		$Audio.play_stored()


func reset_bright():
	modulate = Color(0.75, 0.75, 0.75, 1)

func set_bright():
	modulate = Color(1, 1, 1, 1)
