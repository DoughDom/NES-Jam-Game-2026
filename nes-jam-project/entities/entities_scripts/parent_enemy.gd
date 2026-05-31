extends CharacterBody2D

class_name parent_enemy

@export var enemy_name: String
@export var max_hp: int
@export var attack: int
@export var defense: int
@export var speed: int 
@export var gold_reward: int

var curr_hp: int

signal died(enemy)
signal damaged(amount)
signal action_done

func _ready():
	curr_hp = max_hp

# all these functions should be overrided by the child classes
func take_turn(battle_state: Dictionary): 
	var target = battle_state.get("player")
	attack_target(target)

func take_damage(amount: int):
	var real_dmg = max(0, amount - defense)
	curr_hp -= real_dmg
	damaged.emit(real_dmg)
	$enemy_animations.play("hurt")
	if curr_hp <= 0:
		die()
	
func attack_target(target):
	$enemy_animations.play("attack")
	target.take_damage(attack)
	
func die():
	$enemy_animations.play("death")
	
	
func is_alive() -> bool:
	return curr_hp > 0

	
