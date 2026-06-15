extends CanvasLayer
class_name BattleInterface

signal selection_complete

@export var battleMenuScene: PackedScene
@export var formlessMenuScene: PackedScene
@onready var battleMenuAnchor: Control = $Menus/BattleMenuAnchor
var battleScene: BattleScene

var chosenAction: BattleAction
var chosenTargets: Array[BattleEntity]

func _ready() -> void:
	battleScene = get_parent() as BattleScene

func openBattleMenu(player: BattleEntity) -> void:
	var newBattleMenu = battleMenuScene.instantiate() as BattleMenu
	newBattleMenu.user = player
	newBattleMenu.actionSelectionComplete.connect(actionChosen)
	battleMenuAnchor.add_child(newBattleMenu)
	
	
	await newBattleMenu.actionSelectionComplete
	
	var targets = chosenAction.getPossibleTargets(player, battleScene.roster)
	
	
func actionChosen(action: BattleAction) -> void:
	chosenAction = action
	

func targetsChosen(targets: Array[BattleEntity]) -> void:
	chosenTargets = targets
