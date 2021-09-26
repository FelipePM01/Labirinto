extends Control

signal crystal_pressed
export(NodePath) var main_crystal
export(NodePath) var extra_crystal

export(Array, Texture) var neutral_crystals
export(Array, Texture) var pressed_crystals


func _ready():
	$Poderes/VBoxContainer/HBoxContainer/MainCrystal.texture = neutral_crystals[Global.jogador-1]


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		$Pause.pause()

func _on_PauseButton_button_up():
	$Pause.pause()


func enable_crystal(crystal_type):
	if crystal_type == "main":
		get_node(main_crystal).texture_normal = neutral_crystals[Global.jogador-1]
		get_node(main_crystal).texture_pressed = pressed_crystals[Global.jogador-1]
		get_node(main_crystal).visible = true
	else:

		get_node(extra_crystal).visible = true


func enable_password(value):
	$Senha.visible = value


func _on_MainCrystal_button_up():
	emit_signal("crystal_pressed", "main")


func _on_ExtraCrystal_button_up():
	emit_signal("crystal_pressed", "extra")


func _on_Password_victory():
	print_debug("WE DID IT")
	$AnimationPlayer.play("SlowFade")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "SlowFade":
		$AnimationPlayer/Chave.play()
		$AnimationPlayer/Musica.play_music()
		$AnimationPlayer.play("RollCredits")
	elif anim_name == "RollCredits":
		get_tree().change_scene("res://Menu/MainMenu.tscn")
