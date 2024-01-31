extends Node2D

const location = Vector2(300, 100)
@onready var laser_container = $Laser_container
var player = null

func _ready():
	player = $Player
	assert(player != null)
	player.laser_shot.connect(_on_player_laser_shot)
	if 1 == randi() % 50:
		spawnEnemy(EnemyNairanFighter, location)


func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func spawnEnemy(enemy_scene, pos):
	var enemy = enemy_scene.instantiate()
	enemy.global_position = pos
	add_child(enemy)
