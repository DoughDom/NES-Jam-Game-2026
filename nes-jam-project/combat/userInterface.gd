extends CanvasLayer
class_name BattleInterface

signal selection_complete

var chosenAction: BattleAction
var chosenTargets: Array[BattleEntity]

func openBattleMenu(player: BattleEntity) -> void:
	var selectedAction: BattleAction
	
	return
