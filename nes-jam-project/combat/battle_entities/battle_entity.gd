@tool
extends Node2D
class_name BattleEntity

@export var displayName: String
@export var stats: Stats = null

@export var isPlayer: bool

@export var avatar: BattleAvatar = null
@export var avatarScene: PackedScene:
	set(value):
		avatarScene = value
		
		if not is_inside_tree():
			await ready
		
		if avatar:
			avatar.queue_free()
			avatar = null
			
		if avatarScene:
			var newScene = avatarScene.instantiate()
			
			avatar = newScene as BattleAvatar
			if !avatar:
				push_warning("WTF dude that is NOT a valid avatarScene file... ",
				"%s deserves way better than a scene like %s" % [name, newScene.name])
				newScene.free()
				avatarScene = null
				return
			



@export var skills: Array[BattleAction]
var basicAttack: AttackAction = AttackAction.new()

var turnManager: TurnManager
var interface: BattleInterface

func _init(
	eName: String, 
	eStats: Stats, 
	eIsPlayer: bool, 
	eSkills: Array[BattleAction], 
	eAvatarScene: PackedScene) -> void:
	
	if eStats:
		stats = eStats.duplicate()
	else:
		push_warning("Entity %s was not given a stats object! Using default stats" % [displayName])
		stats = stats.new()
		
	displayName = eName
	
	isPlayer = eIsPlayer
	avatarScene = eAvatarScene
	skills.assign(eSkills)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	turnManager = get_parent()
	stats = stats.duplicate()
	interface = turnManager.get_parent().find_child("BattleInterface") as BattleInterface
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func takeTurn(roster: BattleRoster) -> void:
	var action: BattleAction
	var targets: Array[BattleEntity]
	if (isPlayer):
		interface.openBattleMenu(self)
		await interface.selection_complete
	else:
		action = basicAttack
		targets = roster.players
	
	await action.execute(self, targets)


func executeAction(action: BattleAction, targets: Array[BattleEntity]) -> void:
	await action.execute(self, targets)

func takeDamage(damage: int, source: BattleEntity = null ) -> void:
	
	avatar.play("hurt")
	stats.hp -= damage
	
	return
	
func die() -> void:
	pass
