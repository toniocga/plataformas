extends Node

var vidasIniciales = 3
var puntuacion = 0
var vidas = vidasIniciales
var nivel = 0

func _ready():
	print("puntuación: ", puntuacion, ", vidas: ", vidas , ", nivel", nivel)
	pass
func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ESCAPE:
            get_tree().quit()
