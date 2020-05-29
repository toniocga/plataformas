extends Node

#var vidasIniciales : int
var puntuacion : int
var monedas : int
var vidas : int
var nivel : int
var carpeta_niveles : String
var numero_max_niveles : int

func _ready():
	nivel = 1
	puntuacion = 0
	monedas = 0
	vidas = 3
	
	carpeta_niveles = "res://Juego/Escenarios/Niveles"
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
