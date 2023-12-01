extends Node

@export var monstre_scene: PackedScene
var score 

func game_over():
	$Music.stop()
	$MusicGameOver.play()
	$ScoreTimer.stop()
	$MonstreTimer.stop()
	$Hud.show_game_over()
	
func new_game():
	$Music.play()
	score = 0
	$Player.start($StarPosition.position)
	$StartTimer.start()
	$Hud.update_score(score)
	$Hud.show_message("Preparez-vous")


func _on_start_timer_timeout():
	$MonstreTimer.start()
	$ScoreTimer.start()
	


func _on_score_timer_timeout():
	score +=1
	$Hud.update_score(score) 


func _on_monstre_timer_timeout():
	var monstre = monstre_scene.instantiate()
	
	var monstre_spawn_location = get_node("MonstrePath2D/MonstreSpawnLocation")
	monstre_spawn_location.progress_ratio = randf()
	
	var direction = monstre_spawn_location.rotation + PI/2;
	
	monstre.position = monstre_spawn_location.position; 
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	monstre.linear_velocity = velocity.rotated(direction)
	
	add_child(monstre)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
