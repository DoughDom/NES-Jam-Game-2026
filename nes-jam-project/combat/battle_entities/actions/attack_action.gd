extends BattleAction
class_name AttackAction


# Called when the node enters the scene tree for the first time.

func execute(user: BattleEntity, targets : Array[BattleEntity]) -> void:
	var damage = 5 * (user.atk/targets[0].def)
	targets[0].takeDamage(damage, user)
	
func canExecute() -> bool:
	return true
