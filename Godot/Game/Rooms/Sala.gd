extends Node2D


func setup(rug_texture, id):
	$SalaTemplate.id = id
	$Rug.texture = rug_texture
	if Global.jogador == 2:
		$Rug/Number.text = str(id)
	else:
		$Rug/Number.text = ""
