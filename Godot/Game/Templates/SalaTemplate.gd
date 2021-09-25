extends Node2D

var id
onready var game = get_parent().get_parent()
enum { LEFT, RIGHT, UP, DOWN, NOTHING}
func _on_PortaEsquerda_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		game.change_room(game.arrowToRoom(LEFT,id))


func _on_PortaDireita_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		game.change_room(game.arrowToRoom(RIGHT,id))


func _on_PortaSuperior_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		game.change_room(game.arrowToRoom(UP,id))


func _on_PortaInferior_input_event(viewport, event, shape_idx):
	if (event.type == InputEvent.MOUSE_BUTTON && event.pressed):
		game.change_room(game.arrowToRoom(DOWN,id))


