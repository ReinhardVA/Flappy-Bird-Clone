extends Node2D

@export var obstacle_scene: PackedScene

func _ready():
	new_game()
	$UserInterface.z_index = 2
	$ground.z_index = 2
func new_game():
	$UserInterface.show_game_start()
	await get_tree().create_timer(1.5).timeout
	start_game()

func start_game():
	$StartTimer.start()
	
func _on_start_timer_timeout():
	$PipeTimer.start()

func _on_pipe_timer_timeout():
	var pipes = obstacle_scene.instantiate()
	var min_y_position = 200
	var max_y_position = 400
	var pipes_y_position = randf_range(min_y_position, max_y_position)
	var pipes_spawn_location = $Path2D/PathFollow2D
	
	pipes_spawn_location.progress_ratio = randf()
	pipes.position = Vector2(pipes_spawn_location.position.x, pipes_y_position)
	add_child(pipes) 
	
	pipes.connect("point", Callable($UserInterface, "_earn_point"))


func game_over():
	$PipeTimer.stop()
	$UserInterface.show_game_over()
 
