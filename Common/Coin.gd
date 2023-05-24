extends Area2D
export var score := 10


onready var animation_player = $AnimationPlayer
onready var collision_shape_2d = $CollisionShape2D
onready var audio_coin_collected = $AudioCoinCollected



func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free() 


func _on_Coin_body_entered(body):
	animation_player.play("bounce")
#	collision_shape_2d.disabled = true
#	audio_coin_collected.play()
	Global.coins += 1
	Global.current_score += score
