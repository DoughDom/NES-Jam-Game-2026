extends Control
class_name BattleButton


@onready var cursorAnchor = $CursorAnchor as Marker2D


var buttonAction: String
@onready var label = $Label as Label

func display(action: String):
	buttonAction = action

func _ready() -> void:
	label.text = buttonAction
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
