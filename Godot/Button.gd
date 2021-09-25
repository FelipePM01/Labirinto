extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#connect('button_up', self, 'reset_bright')
	connect('mouse_entered', self, 'set_bright')
	connect('mouse_exited', self, 'reset_bright')
	modulate = Color(0.75, 0.75, 0.75, 1)

func reset_bright():
	modulate = Color(0.75, 0.75, 0.75, 1)

func set_bright():
	modulate = Color(1, 1, 1, 1)
