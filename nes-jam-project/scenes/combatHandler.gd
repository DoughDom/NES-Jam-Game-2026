extends CanvasLayer

var _activeBattle: BattleScene = null

func _ready() -> void:
	Events.combatTriggered.connect(startCombat)
	
	
func startcombat()
