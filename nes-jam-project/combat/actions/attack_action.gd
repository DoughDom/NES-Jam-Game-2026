extends BattleAction
class_name AttackAction


# Called when the node enters the scene tree for the first time.

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	var damage = 5 * (user.stats.atk/targets[0].stats.def)
	targets[0].takeDamage(damage, user)
	
func canExecute(user: BattleEntity, roster: BattleRoster) -> bool:
	return true
