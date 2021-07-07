extends Node2D
#onready var sonido_disparo : AudioStreamPlayer2D
export (float) var granada_angulo = 300 #setget angulo_granada
export  (int) var velocidad_granada = 8
export (int) var gravedad_granada = 12

var granada_escena = preload("res://Juego/Escenarios/Potenciadores/armas_player/granada_01/granada_01.tscn")
var direcion_fuerza := Vector2()

func _ready():
#	sonido_disparo = $AudioStreamPlayer2D
#	print(get_owner().get_parent().name)
	pass
	
func angulo_granada(granada_ang):
	if granada_ang:
		granada_angulo = 600
	else:
		granada_angulo = 300
#func angulo_granada(valor):
#	granada_angulo  = clamp(valor,0,359)
#
func actualizar_direcion():
	direcion_fuerza = Vector2(cos(granada_angulo*(PI/180)),sin(granada_angulo*(PI/180)))* velocidad_granada
	
func lanzar_granada():
	var granada = granada_escena.instance()
	granada.set_global_position(get_parent().get_global_position())
	granada.lanzar_granada(direcion_fuerza, gravedad_granada)
	get_owner().get_parent().add_child(granada)
	