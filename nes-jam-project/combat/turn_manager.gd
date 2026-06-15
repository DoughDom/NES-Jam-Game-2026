extends Node
class_name TurnManager

signal combatFinished(playerVictory: bool)

var roster : BattleRoster

var _cachedActions: = {}
var _activeAction: BattleAction = null  

var activeFighter: BattleEntity
var turnOrder: Array[BattleEntity]
var turnQueue: Array[BattleEntity]
var roundCounter: int

func initialize() -> void:
	var players: Array[BattleEntity]
	var enemies: Array[BattleEntity]
	players.assign(
		get_children().filter(
			func(i): return i.isPlayer
		)
	)
	enemies.assign(
		get_children().filter(
			func(i): return !i.isPlayer
		)
	)
	roster = BattleRoster.new(players, enemies)
	for child in get_children():
		turnOrder.append(child)
	
	turnQueue.assign(turnOrder)
	roundCounter = 0
	
	start()
	
	

func start() -> void:
	playRound()

func playRound() -> void:
	
	
	roundCounter += 1
	while (!turnQueue.is_empty()):
		activeFighter = turnQueue.pop_front()
		await activeFighter.takeTurn(roster)
	
	if(true == false):
		playRound()
