extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Jogador1_button_up():
	pass

func _on_Jogador2_button_up():
	pass # Replace with function body.

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
