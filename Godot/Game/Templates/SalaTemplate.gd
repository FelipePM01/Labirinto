extends Node2D

var id
onready var game = get_parent().get_parent()
enum { LEFT = 0, RIGHT, UP, DOWN, NOTHING}
const opposite_direction = {LEFT:RIGHT, RIGHT:LEFT, UP:DOWN, DOWN:UP, NOTHING:NOTHING}

const TIME_TO_MOVE = 0.75
var positions = [Vector2(50, 160), Vector2(430, 160), Vector2(240, 50), Vector2(240, 270),
Vector2(240, 160)]
var queued_direction = null
var player = null
onready var player_prefab = preload("res://Game/Player.tscn")

export(AudioStream) var door_sound


func _ready():
	$Tween.connect("tween_completed", self, "tween_completed")


func setup(id, entrance_direction):
	self.id = id
	player = player_prefab.instance()
	add_child(player)
	move_child(player, get_child_count()-1)
	game.setup_player(player)
	
	player.set_moving(opposite_direction[entrance_direction])
	$Tween.stop_all()
	$Tween.interpolate_property(player, "position", positions[entrance_direction], 
								positions[NOTHING], TIME_TO_MOVE)
	$Tween.start()
	
	if entrance_direction == NOTHING:
		player.reappear()


func move_to_door(direction):
	queued_direction = direction
	
	# Audio
	AudioManager.stream = door_sound
	AudioManager.play()
	
	# Player move
	player.set_moving(direction)
	$Tween.stop_all()
	$Tween.interpolate_property(player, "position", player.position, positions[direction], TIME_TO_MOVE)
	$Tween.start()


func _on_PortaEsquerda_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		move_to_door(LEFT)


func _on_PortaDireita_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		move_to_door(RIGHT)


func _on_PortaSuperior_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		move_to_door(UP)


func _on_PortaInferior_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton and event.pressed):
		move_to_door(DOWN)


func tween_completed(object, key):
	player.set_idle()
	if queued_direction == null:
		return
	game.change_room(game.arrow_to_room(queued_direction, id), opposite_direction[queued_direction])
