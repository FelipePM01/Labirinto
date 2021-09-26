extends "res://Game/Objects/Planet.gd"

export var jogador_excluido = 0
export var main = false
signal activated

func _ready():
	$Sprite.texture = planet
	if jogador_excluido == Global.jogador or (main and Global.main_crystal) or (!main and Global.extra_crystal):
		visible = false


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		$Audio.play()
		$Timer.stop()
		$Shadow.visible = false
		$Tween.interpolate_property($Sprite, "scale", Vector2(1, 1), Vector2(0, 0), 0.4)
		$Tween.start()
		if main:
			emit_signal("activated", "main_crystal")
		else:
			emit_signal("activated", "extra_crystal")


func _on_Tween_tween_all_completed():
	visible = false
