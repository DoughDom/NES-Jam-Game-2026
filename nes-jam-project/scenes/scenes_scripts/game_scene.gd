extends Node2D
class_name GameScene

var battleScene : BattleScene
var testEntity : BattleEntity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	battleScene = find_child("BattleScene")
	
	testEntity = find_child("Bob")
	#battleScene.initialize([testEntity])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
	
func _enter_scene() -> void:
	pass

func _exit_scene() -> void:
	pass
	
