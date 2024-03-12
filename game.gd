extends Node2D

var puntaje2 = 0
var puntaje1 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(round($tiempoMuerto.time_left))
	if Input.is_action_just_pressed("PAUSA"):
		$VBoxContainer.show()
		get_tree().paused = true


func _on_arco_izquierdo_area_entered(area):
	if area == $Ball:
		$tiempoMuerto.start()
		puntaje2 += 1
		$CanvasLayer/HBoxContainer/Score2.text = str(puntaje2)
		$Label.show()


func _on_arco_derecho_area_entered(area):
	if area == $Ball:
		$tiempoMuerto.start()
		puntaje1 += 1
		$CanvasLayer/HBoxContainer/Score1.text = str(puntaje1)
		$Label.show()


func _on_tiempo_muerto_timeout():
	$Label.hide()


func _on_nuevo_juego_pressed():
	puntaje1 = 0
	puntaje2 = 0
	$CanvasLayer/HBoxContainer/Score1.text = str(puntaje1)
	$CanvasLayer/HBoxContainer/Score2.text = str(puntaje2)
	$Ball.velocity = Vector2()
	$tiempoMuerto.start()
	get_tree().paused = false
	$VBoxContainer.hide()
	$Label.show()


func _on_salir_pressed():
	get_tree().quit()
	
