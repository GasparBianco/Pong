extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Player1_DOWN"):
		position.y += delta * 600
	elif Input.is_action_pressed("Player1_UP"):
		position.y -= delta * 600
