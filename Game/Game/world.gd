extends Node2D

const location = Vector2(300, 100)
@onready var laser_container = $Laser_container
var player = null

func _ready():
	var use_array_values = "Waiting for {0} is a play by {1}, and {0} Engine is named after it."
	print(use_array_values.format(["Godot", "Samuel Beckett"]))
	player = $Player
	Globals.player = player
	assert(player != null)
	player.laser_shot.connect(_on_player_laser_shot)
	if true:
		print("new nairanFighter")
		spawnEnemy(EnemyNairanFighter, location)


func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func spawnEnemy(enemy_scene, pos):
	print("spawnEnemy")
	var unFormatedstr = "res://Game/{0}.tscn"
	print(unFormatedstr.format([enemy_scene]))
	var Enemy = load(unFormatedstr.format([enemy_scene]))
	var enemy = enemy_scene.instantiate()
	
	enemy.global_position = pos
	add_child(enemy)
