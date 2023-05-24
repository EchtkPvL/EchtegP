extends Node2D


const PlayerScene = preload("res://Player/Player.tscn")

onready var timer = $Timer
onready var player = $Player


onready var camera = $Camera2D


var player_spawn_location = Vector2.ZERO


func _ready():
	print(player.global_position)
	print(player.position)
	Global.current_score = 0
	Global.current_level = 0
	VisualServer.set_default_clear_color(Color.lightblue)
	player.connect_camera(camera)
	player_spawn_location = player.position
	Events.connect("player_died", self, "_on_player_died")
	Events.connect("hit_checkpoint", self, "_on_hit_checkpoint")


func _on_player_died():
	print("died")
	timer.start(1.0)
	yield(timer, "timeout")
	var player = PlayerScene.instance()
	player.position = player_spawn_location
	
	add_child(player)
	print('player added')
	player.connect_camera(camera)
	print(player.position)


func _on_hit_checkpoint(checkpoint_position):
	player_spawn_location = checkpoint_position
