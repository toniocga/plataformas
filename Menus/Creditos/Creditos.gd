extends Node2D

onready var inicio = load("res://scenes/Menu_entrar.tscn").instance()
# Called when the node enters the scene tree for the first time.
#func _ready():
#
#	pass # Replace with function body.

func _on_Timer_timeout():
#	no entra
	print(get_parent().name)
	get_node("/root").add_child(inicio)
	queue_free()
	pass # Replace with function body.
