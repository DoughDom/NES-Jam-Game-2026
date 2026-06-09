extends Node2D

class_name BattleScene

var battleActive : bool = false

signal victory
signal gameOver
signal battleEnded

var turnManager : TurnManager

func initialize(fighters: Array[BattleEntity]):
	turnManager = find_child("TurnManager")
	for fighter in fighters:
		turnManager.add_child(fighter)
