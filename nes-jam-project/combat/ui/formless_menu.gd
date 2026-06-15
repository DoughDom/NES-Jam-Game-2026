extends VMenuBase
class_name FormlessMenu

signal targetSelected(target)
signal cancelled

@onready var cursor: BattleCursor = $NinePatchRect/BattleCursor as BattleCursor
var targetNodes: Array[Node2D]

func setTargets(targets: Array[Node2D]): 
	cursor.set_as_top_level(true)
	targetNodes.assign(targets)
	for target in targetNodes:
		entries.append(target.get_parent().name)

func _confirm():
	targetSelected.emit(targetNodes[selectedIndex].get_parent())

func _cancel():
	queue_free()

func _updateCursor():
	cursor.position.y = targetNodes[selectedIndex].position.y
