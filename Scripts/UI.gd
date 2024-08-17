extends Control

var score = 0

func show_game_start():
	$GameStartSprite.show()
	$SpriteTimer.start()
	$GameOverSprite.hide()
	$Label.text = str(score)

func show_game_over():
	$GameOverSprite.show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $GameOverSprite.visible:
		retry_game()

func _earn_point():
	score += 1
	$Label.text = str(score)


func _on_sprite_timer_timeout():
	$GameStartSprite.hide()

func retry_game():
	score = 0
	get_tree().reload_current_scene()
