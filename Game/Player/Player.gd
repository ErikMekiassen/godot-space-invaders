extends CharacterBody2D

signal laser_shot(laser_scene, location)

var speed = 420.0
var laser_scene = preload("res://Game/Laser/Laser.tscn")

@onready var muzzle = $Muzzle

var shoot_timer = 0.0
var shoot_delay = 0.05  # 100 milliseconds

func _process(delta):
	if Input.is_action_pressed("shoot"):
		# Check if enough time has passed since the last shoot
		if shoot_timer >= shoot_delay:
			# Call the shoot function
			shoot()
			# Reset the timer
			shoot_timer = 0.0
		else:
			# Increment the timer
			shoot_timer += delta

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		position.x = position.x + direction * speed * delta
	move_and_slide()

func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
