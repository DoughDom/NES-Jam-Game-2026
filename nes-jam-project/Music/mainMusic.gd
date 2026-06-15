extends Node

func _ready():
	$mainAudio.finished.connect(_on_intro_finished)
	
func play_music():
	$mainAudio.play()

func _on_intro_finished():
	$mainAudioLoop.play()
