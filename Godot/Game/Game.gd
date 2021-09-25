extends Node2D

enum { LEFT = 0, RIGHT, UP, DOWN, NOTHING}
var arrows = [
DOWN, RIGHT, RIGHT, LEFT, LEFT,
DOWN, UP, LEFT, RIGHT, UP,
DOWN, LEFT, LEFT, UP, UP,
DOWN, RIGHT, UP, UP, UP,
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
	var new_instance = rooms[current_room].instance()
	add_child(new_instance)
	move_child(new_instance, get_child_count()-1)
	current_room_scene = new_instance
	if Global.jogador == 1:
		new_instance.setup(rugs[arrows[current_room]], current_room)
	else:
		new_instance.setup(rugs[4], current_room)


func blue_power(current_room):
	if current_room >= 13:
		if current_room % 2 == 0:
			return current_room/2
		else:
			return current_room
	else:
		return current_room * 2


func red_power(current_room):
	return arrow_to_room(arrows[current_room-1], current_room)


func left_to_right(room):
	if ((room-1)/5)%2==0:
		return 1
	else:
		return -1


func arrow_to_room(arrow, current_room):
	var left_to_right = left_to_right(current_room)
	match (arrow):
		LEFT:
			return current_room- left_to_right
		RIGHT:
			return  current_room+left_to_right
		UP:
			return current_room - (10+left_to_right +2*left_to_right*((current_room-1)%5))%10
		DOWN:
			return current_room + (10-left_to_right -2*left_to_right*((current_room-1)%5))%10
		NOTHING:
			return current_room


func green_power(current_room):
	return 26 - current_room


func _on_UI_crystal_pressed(crystal_type):
	var next_room = null
	if crystal_type == 'main':
		if Global.jogador == 1:
			next_room = blue_power(crystal_type)
		else:
			next_room = red_power(crystal_type)
	else:
		next_room = green_power(crystal_type)
	
	change_room(next_room)
