extends EnemyParent

class_name EnemyNairanFighter
const speedModifier = 0.5

func _physics_process(delta):
	enemyAI(delta, speedModifier)



func _on_hit_area_entered(body:Area2D):
	if body.name == "Laser":
		print("nairan fighter is hit")
		queue_free()
	if body.name == "Hitbody":
		print("nairan fighter is hit")
		queue_free()
