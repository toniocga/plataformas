extends Node

var puntuacion = 0
var vidas = 3
var nivel = 0

func _ready():
	print("puntuación: ", puntuacion, ", vidas: ", vidas , ", nivel", nivel)
	pass
func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ESCAPE:
            get_tree().quit()