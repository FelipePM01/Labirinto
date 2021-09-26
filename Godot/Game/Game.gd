extends Node2D

enum { LEFT = 0, RIGHT, UP, DOWN, NOTHING}
var arrows = [
DOWN, RIGHT, RIGHT, LEFT, LEFT,
UP, RIGHT, LEFT, UP, DOWN,
DOWN, RIGHT, RIGHT, UP, UP,
UP, UP, UP, RIGHT, DOWN,
UP, UP, LEFT, UP, NOTHING]

var current_room = 1
var current_room_scene = null

export(Array, Texture) var rugs
export(Array, PackedScene) var rooms
export(NodePath) var UI


func _ready():
	if Global.jogador == 1:
		change_room(2)
	else:
		change_room(6)


func change_room(next_room):
	print_debug(next_room)
	
	# room events
	if ((next_room == 1 and Global.jogador == 1) or 
		(next_room == 15 and Global.jogador == 2)):
		get_node(UI).enable_crystal('main')
	elif next_room == 16:
		get_node(UI).enable_crystal('extra')
	get_node(UI).enable_password(next_room == 25)
	
	# remove current room
	if current_room_scene != null:
		current_room_scene.queue_free()
	
	# create new room
	var new_instance = rooms[next_room-1].instance()
	add_child(new_instance)
	move_child(new_instance, get_child_count()-1)
	current_room_scene = new_instance
	if Global.jogador == 1:
		new_instance.setup(rugs[arrows[next_room-1]], next_room)
	else:
		new_instance.setup(rugs[4], next_room)
	
	current_room = next_room


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
	var next_room = null
	if crystal_type == 'main':
		if Global.jogador == 1:
			next_room = blue_power(current_room)
		else:
			next_room = red_power(current_room)
	else:
		next_room = green_power(current_room)
	
	change_room(next_room)
