extends Node

@export var FPS:int = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = FPS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
