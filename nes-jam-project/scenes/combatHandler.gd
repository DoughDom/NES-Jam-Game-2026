extends CanvasLayer

@export var _activeBattle: BattleScene
@export var battleScene: PackedScene

@onready var _combatContainer: = $CenterContainer as CenterContainer

func _ready() -> void:
	Events.combatTriggered.connect(startCombat)
	
	
func startCombat(encounter: Encounter) -> void:
	assert(
		_activeBattle == null,
		"they busy rn lil bro"
	)
	
	var new_battle: = battleScene.instantiate() as BattleScene
	assert(
		new_battle != null,
		"bro that is not a battlescene, yo ass tweakin bruh"
	)
	
	
	_activeBattle = new_battle
	_combatContainer.add_child(_activeBattle)
	_activeBattle.turnManager.combatFinished.connect(on_combat_finished)
	
	_activeBattle.initialize(encounter)
	

func on_combat_finished(isPlayerVictor: bool):
	assert(_activeBattle != null, "YIKES")
	_activeBattle.queue_free()
	_activeBattle = null
	Events.combatFinished.emit(isPlayerVictor)
	
	
	
