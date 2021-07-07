extends Node2D


onready var player = get_parent().get_parent().get_node("Player")
var dere = 0
var izq = 0
onready var pos_controles = get_node("controles")
onready var pos_botones = get_node("botones")
onready var viewport_size = get_parent().get_parent().get_viewport().size
	


func _ready():
	pos_controles.set_position(Vector2(0 + 20 , viewport_size.y - 100))
	pos_botones.set_position(Vector2(viewport_size.x - 120 , viewport_size.y - 100))
	pass

func _on_botonizq_button_down():
	izq = 1
	player.direction_x = dere - izq
	player.movimiento()
	pass
func _on_botonizq_button_up():
	izq = 0
	player.direction_x = dere - izq
	pass
	
func _on_botondere_button_down():
	dere = 1
	player.direction_x = dere - izq
	player.movimiento()
	pass
func _on_botondere_button_up():
	dere = 0
	player.direction_x = dere - izq
	pass
	
func _on_botonarriba_button_down():
	if player.snap == true:
		player.salto()
	pass

func _on_botonA_button_down():
	player.disparo_1()
	pass

func _on_botonB_button_down():
	player.disparo_2()
	pass







