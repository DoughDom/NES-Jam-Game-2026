@tool
extends Marker2D
class_name BattleAvatar

signal animationComplete(user: BattleEntity)

@onready var front: = $Front as Marker2D
@onready var _anim: = $Center/AnimationPlayer as AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func play(animName: String) -> void:
	assert(_anim.has_animation(animName), "'%s' does not have animation '%s'"
		% [name, animName])
	_anim.play(animName)

func is_playing() -> bool:
	return _anim.is_playing()
