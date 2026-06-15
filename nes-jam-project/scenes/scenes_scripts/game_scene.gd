extends Node2D
class_name GameScene

@export var encounter: Encounter
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#battleScene.initialize([testEntity])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if Input.is_action_just_pressed("select"):
		Events.combatTriggered.emit(encounter)
	
func _enter_scene() -> void:
	pass

func _exit_scene() -> void:
	pass
	
