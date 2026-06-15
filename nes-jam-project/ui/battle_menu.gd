extends VMenuBase
class_name BattleMenu

signal actionSelectionComplete(action: BattleAction)
signal cancelled
signal flee


@onready var ninePatch: NinePatchRect = $NinePatchRect as NinePatchRect
@onready var vBoxContainer: VBoxContainer =$NinePatchRect/MarginContainer/VBoxContainer as VBoxContainer
@onready var cursor: BattleCursor = $NinePatchRect/BattleCursor as BattleCursor

@export var skillMenuScene: PackedScene
@export var itemMenuScene: PackedScene

var user: BattleEntity:
	set(value):
		user = value



func _ready():
	assert(
		user,
		"HELL NAH UR ASS TWEAKIN JIGSAW"
		)
	for entry in entries:
		var newLabel = Label.new()
		newLabel.text = entry
		
		vBoxContainer.add_child(newLabel)
		selectedIndex = 0
	_updateCursor()
	ninePatch.size.y = entries.size() * 17 + 4



func _confirm():
	match(entries[selectedIndex]):
		"fight":
			_actionChosen(user.attackAction)
			ninePatch.visible = false
		"skill":
			var newSkillMenu = skillMenuScene.instantiate() as SkillMenu
			ninePatch.visible = false
			newSkillMenu.user = user
			add_child(newSkillMenu)
			newSkillMenu.cancelled.connect(_reconsider)
		"bag":
			return
			#var newItemMenu = itemMenuScene.instantiate() as ItemMenu
			#ninePatch.visible = false
			#add_child(newItemMenu)
			#newItemMenu.cancelled.connect(_reconsider)
		"run":
			flee.emit()
		_:
			return

func _reconsider():
	ninePatch.visible = true
	
func _actionChosen(action: BattleAction):
	actionSelectionComplete.emit(action)
	ninePatch.visible = false

func _updateCursor():
	cursor.position.y = vBoxContainer.get_child(selectedIndex).position.y + 10
