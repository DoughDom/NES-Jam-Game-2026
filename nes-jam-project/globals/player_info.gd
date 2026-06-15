extends Node

var player_name: String

var mouzeStats: Stats = preload("res://combat/battle_entities/mouse/mouse_stats.tres")
var mouzeAvatarScene: PackedScene
var skills: Array[BattleAction]

var items: Array[String] = ["PokeBall", "Phoenix Down", "Glock 19", "White Cane", ""]

func _init():
	
	mouzeAvatarScene = preload("res://combat/battle_entities/mouse/mouse_avatar.tscn")

func getParty() -> Array[BattleEntity]:
	var party: Array[BattleEntity] = []
	var a = BattleEntity.new(
		"Mouze",
		mouzeStats,
		true,
		skills,
		mouzeAvatarScene
	)
		
	party.append(a)

	return party
