extends BattleAction
class_name SkillAction

@export_group("UI")

@export var skillName: String
@export var description: String
@export var power: int

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	pass

func canExecute() -> bool:
	return true
