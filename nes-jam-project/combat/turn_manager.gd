extends Node

class_name TurnManager

var roster : BattleRoster

var _cachedActions: = {}
var _activeAction: BattleAction = null  

var activeFighter: BattleEntity

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
	activeFighter = get_child(0)


func playTurn() -> void:
	
	playTurn()
	
