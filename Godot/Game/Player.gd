extends Node2D

onready var player_sprite = $Hovering/Sprite

func _on_Timer_timeout():
	player_sprite.frame = (player_sprite.frame + 1) % (player_sprite.hframes * player_sprite.vframes)
