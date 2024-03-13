extends Node2D

var puntaje2 = 0
var puntaje1 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuPausa/Contenedor.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Temporizador.text = str(round($TiempoMuerto.time_left))


func _on_arco_izquierdo_area_entered(area):
	if area == $Pelota:
		puntaje2 += 1
		$Puntajes/Puntaje2.text = str(puntaje2)
		$Gol.play()
		_preparacion_nuevo_gol()


func _on_arco_derecho_area_entered(area):
	if area == $Pelota:
		puntaje1 += 1
		$Puntajes/Puntaje1.text = str(puntaje1)
		$Gol.play()
		_preparacion_nuevo_gol()


func _on_tiempo_muerto_timeout():
	$Temporizador.hide()
	$Pelota.comienzo_nuevo_gol()


func _on_nuevo_juego_pressed():
	puntaje1 = 0
	puntaje2 = 0
	$Puntajes/Puntaje1.text = str(puntaje1)
	$Puntajes/Puntaje2.text = str(puntaje2)
	_preparacion_nuevo_gol()
	get_tree().paused = false
	$MenuPausa/Contenedor.hide()
	


func _on_salir_pressed():
	get_tree().quit()
	
func _preparacion_nuevo_gol():
	$Pelota.velocidad = 0
	$Pelota.position = Vector2(640,360)
	$TiempoMuerto.start()
	$Temporizador.show()
	
