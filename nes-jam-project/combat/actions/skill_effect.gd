extends Resource
class_name SkillEffect

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	pass

func canExecute(user: BattleEntity, roster: BattleRoster) -> bool:
	return true
