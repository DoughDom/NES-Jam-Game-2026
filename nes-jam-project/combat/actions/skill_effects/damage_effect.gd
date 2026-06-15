extends SkillEffect

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	var damage = 4 * (user.atk/targets[0].def)
	targets[0].takeDamage(damage, user)

func canExecute(user: BattleEntity, roster: BattleRoster) -> bool:
	return true
