extends Node2D

signal object_interacted

func setup(rug_texture, id, entrance_direction):
	$SalaTemplate.setup(id, entrance_direction)
	$Rug.texture = rug_texture
	if Global.jogador == 2:
		$Rug/Number.text = str(id)
	else:
		$Rug/Number.text = ""


func _on_Crystal_activated(object):
	emit_signal("object_interacted", object)
