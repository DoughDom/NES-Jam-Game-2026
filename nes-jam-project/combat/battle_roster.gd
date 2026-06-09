extends RefCounted
class_name BattleRoster

# Called when the node enters the scene tree for the first time.
var players: Array[BattleEntity] = []

var enemies: Array[BattleEntity] = []


func _init(playerFighters: Array[BattleEntity], enemyFighters: Array[BattleEntity]) -> void:
	players = playerFighters
	enemies = enemyFighters

func get_all_fighters() -> Array[BattleEntity]:
	var all_fighters = players.duplicate()
	all_fighters.append_array(enemies)
	return all_fighters
