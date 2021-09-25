extends Node2D

onready var SalaEsquerda
onready var SalaDireita
onready var SalaSuperior
onready var SalaInferior
onready var CaminhoAzul
onready var CaminhoVermelho
var id
func _on_PortaEsquerda_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		get_tree().changeScene(SalaEsquerda)


func _on_PortaDireita_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		get_tree().changeScene(SalaDireita)


func _on_PortaSuperior_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		get_tree().changeScene(SalaSuperior)


func _on_PortaInferior_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		get_tree().changeScene(SalaInferior)

func PoderAzul():
	get_tree().changeScene(CaminhoAzul)
	
func PoderVermelho():
	get_tree().change_scene(CaminhoVermelho)
