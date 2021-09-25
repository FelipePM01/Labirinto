extends Control

signal crystal_pressed


func enable_crystal(crystal_type):
	if crystal_type == 'main':
		$MainCrystal.visible = true
	else:
		$ExtraCrystal.visible = true


func _on_MainCrystal_button_up():
	emit_signal("crystal_pressed", "main")


func _on_ExtraCrystal_button_up():
	emit_signal("crystal_pressed", "extra")
