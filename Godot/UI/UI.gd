extends Control

signal crystal_pressed
onready var main_crystal=$MarginContainer/VBoxContainer/HBoxContainer/MainCrystal
onready var extra_crystal=$MarginContainer/VBoxContainer/HBoxContainer/ExtraCrystal

func enable_crystal(crystal_type):
	if crystal_type == 'main':
		main_crystal.visible = true
	else:
		extra_crystal.visible = true


func _on_MainCrystal_button_up():
	emit_signal("crystal_pressed", "main")


func _on_ExtraCrystal_button_up():
	emit_signal("crystal_pressed", "extra")
