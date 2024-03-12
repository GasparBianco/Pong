extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("PAUSA"):
		if get_tree().paused: 
			hide()
			get_tree().paused = false
		else: 
			show()
			get_tree().paused = true
