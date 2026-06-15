extends VBoxContainer
class_name ListBattleMenu

signal selectionComplete
@export var entryButton: PackedScene

var _focusedEntryPath: NodePath:
	set(value):
		_focusedEntry = get_node(_focusedEntryPath) as BattleButton
var _focusedEntry: BattleButton
var _entries: Array[BattleButton] = []

@onready var _battleCursor: = $BattleCursor as BattleCursor

func _init(choices: Array[String]):
	for choice in choices:
		var newEntry = entryButton.instantiate()
		newEntry.display(choice)
		add_child(newEntry)
		
func _physics_process(delta):
	if Input.is_action_just_pressed("dpad_up"):
		_focusedEntryPath = _focusedEntry.focus_neighbor_top
	elif Input.is_action_just_pressed("dpad_Down"):
		_focusedEntryPath = _focusedEntry.focus_neighbor_bottom
	elif Input.is_action_just_pressed("A"):
		_focusedEntry.pressed.emit()
		selectionComplete.emit()
