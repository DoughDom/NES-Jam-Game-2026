extends Node

class_name TurnManager

var roster : BattleRoster

var _cachedActions: = {}
var _activeAction: BattleAction = null  

var activeFighter: BattleEntity
var turnOrder: Array[BattleEntity]
var turnQueue: Array[BattleEntity]
var roundCounter: int

func _ready() -> void:
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
	
	turnQueue = turnOrder
	roundCounter = 1
	
	playRound()


func playRound() -> void:
	while (!turnQueue.is_empty()):
		activeFighter = turnQueue.pop_front()
		activeFighter.takeTurn(roster)
		
	
	
	roundCounter += 1
	
