extends Control


var score_file1 = "user://score1.save"
var score_file2 = "user://score2.save"

onready var settings_window = $SettingsWindow
onready var sound_check_button = $SettingsWindow/VBoxContainer/HBoxContainer/SoundCheckButton
onready var score_board_window = $ScoreBoardWindow
onready var score_1 = $"ScoreBoardWindow/VBoxContainer/HBoxContainer/Score 1"
onready var score_2 = $"ScoreBoardWindow/VBoxContainer/HBoxContainer2/Score 2"
onready var quit_confirmation_dialog = $QuitConfirmationDialog


func _ready():
	load_score()
	score_1.text = str(Global.high_score[0]) 
	score_2.text = str(Global.high_score[1])



func _process(delta):
	pass



func _on_SettingsButton_button_up():
	settings_window.popup_centered()


func _on_SoundCheckButton_toggled(button_pressed):
	Global.sound = button_pressed
	AudioServer.set_bus_mute(0,not button_pressed)


func _on_ScoreBoardButton_button_up():
	score_board_window.popup_centered()


func load_score():
	var file = File.new()
	if file.file_exists(score_file1):
		file.open(score_file1, File.READ)
		Global.high_score[0] = file.get_var()
		file.close()
	if file.file_exists(score_file2):
		file.open(score_file2, File.READ)
		Global.high_score[1] = file.get_var()
		file.close()


func _on_Quit_button_up():
	quit_confirmation_dialog.popup()


func _on_QuitConfirmationDialog_confirmed():
	get_tree().quit()
