extends Node2D

class_name BattleScene

var battleActive : bool = false

signal victory
signal gameOver
signal battleEnded

const partyPositions: Array[Vector2] = [
	Vector2(56, 128),
	Vector2(56, 96),
	Vector2(56, 160)
]

const enemyPositions: Array[Vector2] = [
	Vector2(168, 120),
	Vector2(168, 80),
	Vector2(168, 160),
	Vector2(200, 96),
	Vector2(200, 144)
]


@onready var turnManager: TurnManager = $TurnManager as TurnManager
@onready var partyAvatars: Node = $Party
@onready var enemyAvatars: Node = $Enemies


func initialize(encounter: Encounter) -> void:
	
	for partyMember in PlayerInfo.getParty():
		turnManager.add_child(partyMember)
		partyAvatars.add_child(partyMember.avatar)
	
	for enemy in encounter.enemies:
		var newEnemy = enemy.instantiate()
		turnManager.add_child(newEnemy)
		enemyAvatars.add_child(newEnemy.avatar)
	
	var i: int = 0
	for avatar in partyAvatars.get_children():
		avatar.position = partyPositions[i]
		i += 1
		if i > 2:
			break
			
	i = 0
	for avatar in enemyAvatars.get_children():
		avatar.position = enemyPositions[i]
		i += 1
		if i > 4:
			break
	turnManager.initialize()
