extends Node

var vidasIniciales = 3
var puntuacion = 0
var monedas = 0
var vidas = vidasIniciales
var nivel = 1
var carpeta_niveles = "res://Juego/Escenarios/Niveles"
var numero_max_niveles : int

func _ready():
	numero_max_niveles = (lista_archivos_en_directorio(carpeta_niveles).size())


func lista_archivos_en_directorio(path):
    var files = []
    var dir = Directory.new()
    dir.open(path)
    dir.list_dir_begin()

    while true:
        var file = dir.get_next()
        if file == "":
            break
        elif not file.begins_with("."):
            files.append(file)

    dir.list_dir_end()

    return files


func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ESCAPE:
            get_tree().quit()
