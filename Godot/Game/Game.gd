extends Node

enum { LEFT, RIGHT, UP, DOWN, NOTHING}
var arrows = [
DOWN, RIGHT, RIGHT, LEFT, LEFT,
DOWN, UP, LEFT, RIGHT, UP,
DOWN, LEFT, LEFT, UP, UP,
DOWN, RIGHT, UP, UP, UP,
UP, UP, LEFT, UP, NOTHING]

var currentRoom = 1
export var rooms = []





func bluePower(currentRoom):
	if currentRoom >= 13:
		if currentRoom % 2 == 0:
			return currentRoom/2
		else:
			return currentRoom
	else:
		return currentRoom * 2


func redPower(currentRoom):
	var leftToRight = ((currentRoom/5) % 2 == 0)
	
	match (arrows[currentRoom-1]):
		LEFT:
			return currentRoom - leftToRight
		RIGHT:
			return currentRoom + leftToRight
		UP:
			return currentRoom - 5
		DOWN:
			return currentRoom - 5
		NOTHING:
			return currentRoom


func greenPower(currentRoom):
	return 26 - currentRoom
