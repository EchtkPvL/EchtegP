extends Button


export(String, FILE, "*.tscn") var target_level_path = ""


func _on_PlayButton_button_up():
	Transitions.play_exit_transition()
	get_tree().paused = true
	yield(Transitions, "transition_completed")
	Transitions.play_enter_transition()
	get_tree().paused = false
	get_tree().change_scene(target_level_path)
