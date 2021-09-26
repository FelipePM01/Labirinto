extends Control

func pause():
	visible = !visible
	get_tree().paused = !get_tree().paused


func _on_Sair_button_up():
	get_tree().quit()


func _on_Voltar_button_up():
	pause()

func _on_Menu_button_up():
	pause()
	get_tree().change_scene("res://Menu/MainMenu.tscn")
