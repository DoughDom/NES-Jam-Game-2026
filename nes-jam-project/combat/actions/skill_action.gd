extends BattleAction
class_name SkillAction

@export_group("UI")

@export var skillName: String
@export var description: String
@export var power: int
@export var effect: SkillEffect

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	effect.execute(user, targets)

func canExecute(user: BattleEntity, roster: BattleRoster) -> bool:
	return effect.canExecute(user, roster)
