extends SkillEffect
class_name BackflipEffect

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	var damage = 8 * (user.atk/targets[0].def)
	targets[0].takeDamage(damage, user)

func canExecute(user: BattleEntity, roster: BattleRoster) -> bool:
	return true
