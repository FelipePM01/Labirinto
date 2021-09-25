extends Node2D

var state = 0
var rising = true
export(Texture) var planet
export(Array, Texture) var shadows
var y_offset = 0

func _ready():
	$Sprite.texture = planet

func _on_Timer_timeout():
	if state == len(shadows)-1:
		rising = false
	elif state == 0:
		rising = true
	
	if rising:
		state += 1
	else:
		state -= 1
	
	$Sprite.position.y = y_offset + (-5 * state)
	$Shadow.texture = shadows[state]
