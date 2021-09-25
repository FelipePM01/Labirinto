extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Jogador1_button_up():
	Global.jogador = 1

func _on_Jogador2_button_up():
	Global.jogador = 2

func _on_Opcoes_button_up():
	$"Menu Opcoes".visible = true
	$"Menu Principal".visible = false
	$Logo.visible = false

func _on_Sair_button_up():
	get_tree().quit()


func _on_Voltar_button_up():
	$"Menu Opcoes".visible = false
	$"Menu Principal".visible = true
	$Logo.visible = true
