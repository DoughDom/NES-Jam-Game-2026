extends Resource
class_name BattleAction

enum TargetType {
	SELF,
	ALLY,
	ENEMY,
	NONE
}
enum TargetNumber {
	SINGLE,
	ALL
}

@export_group("Targets")
@export var targetType: TargetType
@export var targetNumber: TargetNumber

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	pass

func getPossibleTargets(user: BattleEntity, roster : BattleRoster) -> Array[BattleEntity]:
	match targetType:
		TargetType.SELF:
			return [user]
		TargetType.ALLY:
			if user.isPlayer:
				return roster.players
			else:
				return roster.enemies
		TargetType.ALLY:
			if user.isPlayer:
				return roster.enemies
			else:
				return roster.players
		_:
			return []

func canExecute() -> bool:
	return true
