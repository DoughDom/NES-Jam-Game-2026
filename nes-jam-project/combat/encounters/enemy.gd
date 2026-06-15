extends Resource
class_name Enemy

@export var name: String
@export var stats: Stats
@export var avatar: PackedScene
@export var skills: Array[BattleAction]


func instantiate() -> BattleEntity:
	return BattleEntity.new(
		name,
		stats,
		15,
		false,
		skills,
		avatar.instantiate()
	)
