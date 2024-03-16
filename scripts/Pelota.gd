extends Area2D

var velocidad = 750
var direccion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position += delta * velocidad * direccion
	
func comienzo_nuevo_gol():
	var direccionInicial = randf_range(-1, 1)
	var direccionX = randi_range(0, 1) * 2 - 1
	var x = cos(direccionInicial) * direccionX
	var y = sin(direccionInicial)
	direccion = Vector2(x, y).normalized()
	velocidad = 750

		
func _on_hit_ball(area):
	if area == self:
		direccion.y = randf_range(-1, 1)
		direccion.x *= -1
		direccion = direccion.normalized()
		$Rebote.play()
		velocidad += 20


func _on_pelota_choca_pared(area):
		if area == self:
			direccion.y *= -1
			$Rebote.play()
