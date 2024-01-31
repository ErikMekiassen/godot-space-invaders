extends CharacterBody2D

class_name EnemyParent

func enemyAI(delta, speedModifier: float):
	var speed = 200 * speedModifier
	if (Globals.player.position.x > position.x):
		position.x += speed * delta
	if (Globals.player.position.x < position.x):
			position.x -= speed * delta
