extends RigidBody2D

@export var speed = 600

func _ready():
	var monstre_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(monstre_types[randi() % monstre_types.size()])

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	
