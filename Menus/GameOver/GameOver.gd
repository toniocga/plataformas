extends Node2D


#onready var MenuPrincipal = load("res://Menus/MenuPrincipal/MenuPrincipal.tscn").instance()

func _ready():
	get_node("Sprite").set_position(Vector2(get_viewport().size.x/2 , get_viewport().size.y/2))

func _on_Timer_timeout():
	Global.puntuacion = 0
	Global.vidas = Global.vidasIniciales
	Global.nivel = 0
#	get_node("/root").add_child(MenuPrincipal)
#	get_parent().queue_free()
	Global_cambiar_nivel.goto_scene("res://Menus/MenuPrincipal/MenuPrincipal.tscn")
	pass 
