extends Area2D


var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position += delta * 750 * velocity
	
func newGoal():
	position = Vector2(640,360)
	var initialDirection = randf_range(-1, 1)
	var direccionX = randi_range(0, 1) * 2 - 1
	var x = cos(initialDirection) * direccionX
	var y = sin(initialDirection)
	velocity = Vector2(x, y).normalized()

func _on_ball_entered(area):
	if area == self:
		velocity.y *= -1


func _on_hit_ball(area):
	if area == self:
		velocity.y = randf_range(-1, 1)
		velocity.x *= -1
		velocity = velocity.normalized()


func _on_tiempo_muerto_timeout():
	newGoal()
