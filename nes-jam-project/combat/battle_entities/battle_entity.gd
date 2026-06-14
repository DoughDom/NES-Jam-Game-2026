@tool
extends Node
class_name BattleEntity

@export var displayName: String
@export var stats: Stats
@export var goldReward: int

@export var isPlayer: bool

var avatar: BattleAvatar

var hp: int
var atk: int
var def: int
var spd: int

var skills: Array[BattleAction]

var turnManager: TurnManager
var interface: BattleInterface

func _init(eName: String, eStats: Stats, eGoldReward: int, eIsPlayer: bool, eSkills: Array[BattleAction], eAvatar: BattleAvatar) -> void:
	name = eName
	stats = eStats
	goldReward = eGoldReward
	isPlayer = eIsPlayer
	avatar = eAvatar
	
	skills.assign(eSkills)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = stats.maxHp
	atk = stats.atk
	def = stats.def
	spd = stats.spd
	
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
	
	avatar.play("hurt")
	hp -= damage
	
	return
	
func die() -> void:
	pass
