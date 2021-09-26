extends Node2D

var id
onready var game = get_parent().get_parent()
enum { LEFT, RIGHT, UP, DOWN, NOTHING}
func _on_PortaEsquerda_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		game.change_room(game.arrow_to_room(LEFT,id))


func _on_PortaDireita_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		game.change_room(game.arrow_to_room(RIGHT,id))


func _on_PortaSuperior_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		game.change_room(game.arrow_to_room(UP,id))


func _on_PortaInferior_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		game.change_room(game.arrow_to_room(DOWN,id))


