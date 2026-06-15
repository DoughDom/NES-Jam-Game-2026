extends VMenuBase
class_name ItemMenu

signal skillSelectionComplete(action: BattleAction)

signal cancelled

@onready var ninePatch: NinePatchRect = $NinePatchRect as NinePatchRect
@onready var vBoxContainer: VBoxContainer =$NinePatchRect/MarginContainer/VBoxContainer as VBoxContainer
@onready var cursor: BattleCursor = $NinePatchRect/BattleCursor as BattleCursor

var user: BattleEntity = null



func _ready():
	assert(
		user,
		"HELL NAH UR ASS TWEAKIN JIGSAW"
		)
	entries = []
	for skill in user.skills:
		entries.append(skill.skillName)
	
	
	for entry in entries:
		var newLabel = Label.new()
		newLabel.text = entry
		
		vBoxContainer.add_child(newLabel)
		selectedIndex = 0
	_updateCursor()
	ninePatch.size.y = entries.size() * 17 + 4
	

func _confirm():
	skillSelectionComplete.emit(user.skills[selectedIndex])
	ninePatch.visible = false

func _cancel():
	cancelled.emit()
	queue_free()
	
func _reconsider():
	ninePatch.visible = true
	
