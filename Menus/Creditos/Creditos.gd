extends Node2D

#onready var inicio = load("res://Menus/MenuPrincipal/MenuPrincipal.tscn").instance()
# Called when the node enters the scene tree for the first time.
#func _ready():
#
#	pass # Replace with function body.

func _on_Timer_timeout():
#	no entra
#	print(get_parent().name)
#	get_node("/root").add_child(inicio)
#	queue_free()
	Global_cambiar_nivel.wait_frames = 0
	Global_cambiar_nivel.goto_scene("res://Menus/MenuPrincipal/MenuPrincipal.tscn")

