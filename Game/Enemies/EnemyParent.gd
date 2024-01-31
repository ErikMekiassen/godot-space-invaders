extends CharacterBody2D

class_name EnemyParent
func enemyAI(delta, speedModifier: float):
	var speed = 200 * speedModifier
	if (Globals.platerPos.x > position.x):
		position.x += speed * delta
	if (Globals.platerPos.x < position.x):
			position.x -= speed * delta
