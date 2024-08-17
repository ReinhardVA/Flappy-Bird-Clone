extends CharacterBody2D
signal hit

@export var jump_speed = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float):
	velocity.y += gravity * delta
	velocity = player_movement(velocity)
	var collision = move_and_collide(velocity * delta)
	die(collision)
	update_animation(velocity)

func update_animation(velocity):
	if velocity.y < 0:
		$AnimatedSprite2D.play("Fly")
	else:
		$AnimatedSprite2D.stop()
	
func player_movement(velocity):
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump_speed
	return velocity

func die(collision):
	if collision:
		hide()
		hit.emit()
