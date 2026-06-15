extends Control
class_name VMenuBase


var selectedIndex := 0
@export var entries: Array[String]= []

func _ready():
	pass
	
func _moveUp():
	selectedIndex -= 1
	selectedIndex %= entries.size()
	_updateCursor()
	
func _moveDown():
	selectedIndex += 1
	selectedIndex %= entries.size()
	_updateCursor()
func _confirm():
	pass

func _cancel():
	pass

func _updateCursor():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("dpad_up"):
		_moveUp()
	if event.is_action_pressed("dpad_down"):
		_moveDown()
	if event.is_action_pressed("A"):
		_confirm()
	if event.is_action_pressed("B"):
		_cancel()
