extends Area2D

@export var speed = 700

func _process(delta):
	global_position.y -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("laser left screen")
	queue_free()