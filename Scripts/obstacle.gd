extends Node2D
signal point

var speed = -200

func _physics_process(delta):
	position.x += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	$ScoreArea.queue_free()
	queue_free() # Replace with function body.

func _on_score_area_body_entered(body):
	emit_signal("point")
