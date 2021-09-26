extends Node2D

enum{LEFT = 0, RIGHT, UP, DOWN, NOTHING}
export(Array, Texture) var idle
export(Array, Texture) var horizontal
export(Array, Texture) var front
export(Array, Texture) var back
export(Array, Texture) var particle
export(Texture) var extra_particle
var frame_count = 4
var crystal_type = 'main'
var fading = false
onready var player_sprite = $Hovering/Sprite

signal teleport

func _ready():
	set_idle()


func set_idle():
	$Hovering/Sprite.hframes = 2
	$Hovering/Timer.wait_time = 1
	$Hovering/Sprite.texture = idle[Global.jogador - 1]
	frame_count = 4


func set_moving(direction):
	$Hovering/Timer.wait_time = 0.5
	frame_count = 3
	
	match(direction):
		LEFT:
			frame_count = 3
			scale.x = -1
			$Hovering/Sprite.hframes = 2
			$Hovering/Sprite.texture = horizontal[Global.jogador - 1]
		RIGHT:
			frame_count = 3
			scale.x = 1
			$Hovering/Sprite.hframes = 2
			$Hovering/Sprite.texture = horizontal[Global.jogador - 1]
		DOWN:
			frame_count = 2
			$Hovering/Sprite.hframes = 1
			$Hovering/Sprite.texture = front[Global.jogador - 1]
		UP:
			frame_count = 2
			$Hovering/Sprite.hframes = 1
			$Hovering/Sprite.texture = back[Global.jogador - 1]
		NOTHING:
			$Hovering/Sprite.hframes = 2


func teleport(crystal_type):
	self.crystal_type = crystal_type
	if crystal_type == 'main':
		$Particles.texture = particle[Global.jogador - 1]
	else:
		$Particles.texture = extra_particle
	
	$Particles.emitting = true
	$Hovering/Timer.stop()
	$Tween.interpolate_property($Hovering/Sprite, 'scale', Vector2(1, 1), Vector2(0, 0), 0.35)
	$Tween.start()
	fading = true


func reappear():
	$Tween.interpolate_property($Hovering/Sprite, 'scale', Vector2(0, 0), Vector2(1, 1), 0.35)
	$Tween.start()


func _on_Timer_timeout():
	player_sprite.frame = (player_sprite.frame + 1) % frame_count


func _on_Tween_tween_completed(_object, _key):
	if fading:
		emit_signal("teleport", crystal_type)

