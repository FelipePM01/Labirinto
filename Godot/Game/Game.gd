extends Node2D

enum { LEFT = 0, RIGHT, UP, DOWN, NOTHING}
var arrows = [
RIGHT, RIGHT, DOWN, DOWN, LEFT,
UP, RIGHT, LEFT, UP, DOWN,
DOWN, RIGHT, RIGHT, UP, UP,
UP, UP, UP, UP, DOWN,
UP, RIGHT, UP, UP, NOTHING]

var current_room = 1
var current_room_scene = null
var current_player_instance = null

export(Array, Texture) var rugs
export(Array, PackedScene) var rooms
export(NodePath) var UI


func _ready():
	$Audio.play_music()
	if Global.jogador == 1:
		change_room(2, NOTHING)
	else:
		change_room(6, NOTHING)


func change_room(next_room, direction):
	print_debug(next_room)
	
	# room events
	get_node(UI).enable_password(next_room == 25)
	
	# remove current room
	if current_room_scene != null:
		current_room_scene.queue_free()
	
	# create new room
	var new_instance = rooms[next_room-1].instance()
	add_child(new_instance)
	move_child(new_instance, get_child_count()-3)
	current_room_scene = new_instance
	new_instance.connect("object_interacted", self, "object_interacted")
	if Global.jogador == 1:
		new_instance.setup(rugs[arrows[next_room-1]], next_room, direction)
	else:
		new_instance.setup(rugs[4], next_room, direction)
	
	current_room = next_room


func object_interacted(object):
	match(object):
		"main_crystal":
			get_node(UI).enable_crystal("main")
		"extra_crystal":
			get_node(UI).enable_crystal("extra")


func blue_power(this_room):
	if this_room >= 13:
		if this_room % 2 == 0:
			return this_room/2
		else:
			return this_room
	else:
		return this_room * 2


func red_power(this_room):
	print_debug(this_room)
	return arrow_to_room(arrows[this_room-1], this_room)


func left_to_right(room):
	if (room/5) % 2 == 0:
		return 1
	else:
		return -1


func arrow_to_room(arrow, this_room):
	var left_to_right = left_to_right(this_room-1)
	match (arrow):
		LEFT:
			return this_room - left_to_right
		RIGHT:
			return  this_room + left_to_right
		UP:
			return 10*((this_room - 1)/5) + 1 - this_room
		DOWN:
			return 10*(((this_room - 1)/5) + 1) + 1 - this_room
		NOTHING:
			return this_room


func green_power(this_room):
	return 26 - this_room


func _on_UI_crystal_pressed(crystal_type):
	current_player_instance.teleport(crystal_type)


func teleport(crystal_type):
	var next_room = null
	if crystal_type == 'main':
		if Global.jogador == 1:
			next_room = blue_power(current_room)
		else:
			next_room = red_power(current_room)
	else:
		next_room = green_power(current_room)
	
	change_room(next_room, NOTHING)


func setup_player(player):
	current_player_instance = player
	player.connect('teleport', self, 'teleport')
