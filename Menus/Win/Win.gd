extends Node2D

onready var nivel1 = load("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn").instance()
onready var nivel2 = load("res://Juego/Escenarios/Niveles/Nivel_2/Nivel_2.tscn").instance()
onready var final = load("res://Menus/Creditos/Creditos.tscn").instance()


func _ready():
	Global.nivel += 1
	pass 

func _on_Timer_timeout():
	pasarPantalla()


func pasarPantalla():
	if Global.nivel == 0:
		get_parent().get_parent().queue_free()
		get_node("/root").add_child(nivel1)
		
	if Global.nivel == 1:
		get_parent().get_parent().queue_free()
		get_node("/root").add_child(nivel2)
		
	if Global.nivel == 2: 
		get_parent().get_parent().queue_free()
		get_node("/root").add_child(final)

	pass 
