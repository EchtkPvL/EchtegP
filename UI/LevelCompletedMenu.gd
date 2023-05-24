extends ColorRect


var score_file1 = "user://score1.save"
var score_file2 = "user://score2.save"


# Called when the node enters the scene tree for the first time.
func _ready():
	save_score()


func save_score():
	var file = File.new()
	file.open(score_file1, File.WRITE)
	file.store_var(Global.high_score[0])
	file.close()
	file.open(score_file2, File.WRITE)
	file.store_var(Global.high_score[1])
	file.close()
