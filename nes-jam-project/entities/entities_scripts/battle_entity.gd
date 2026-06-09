extends Node


class_name BattleEntity

@export var displayName: String
@export var maxHp: int
@export var baseAtk: int
@export var baseDef: int
@export var baseSpd: int 
@export var gold_reward: int

@export var isPlayer: bool

var hp: int
var atk: int
var def: int
var spd: int

var skills: Array[BattleAction]

var turnManager: TurnManager
var interface: BattleInterface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = maxHp
	atk = baseAtk
	def = baseDef
	spd = baseSpd
	
	turnManager = get_parent()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func takeTurn(roster: BattleRoster) -> void:
	var action: BattleAction
	var targets: Array[BattleEntity]
	interface.openBattleMenu(self)
	await interface.selection_complete
	
	
	await action.execute(self, targets)


func executeAction(action: BattleAction, targets: Array[BattleEntity]) -> void:
	await action.execute(self, targets)

func takeDamage(damage: int, source: BattleEntity = null ) -> void:
	hp -= damage
	return
	
func die() -> void:
	pass
