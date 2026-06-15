extends Resource
class_name Enemy

@export var name: String
@export var stats: Stats
@export var avatarScene: PackedScene
@export var skills: Array[BattleAction]
@export var goldReward: int

func instantiate() -> BattleEntity:
	return BattleEntity.new(
		name,
		stats,
		false,
		skills,
		avatarScene
	)
