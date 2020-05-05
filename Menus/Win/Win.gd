extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var nivel1 = load("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn").instance()
onready var final = load("res://Menus/Win/Win.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _on_Timer_timeout():
	if Global.nivel == 0:

		get_node("/root").add_child(nivel1)
		Global.nivel += 1
		get_parent().get_parent().queue_free()
	
	elif Global.nivel == 1: # final
		get_node("/root").add_child(final)
		get_parent().get_parent().queue_free()

#		Global.nivel = 0 # está en el menú  entrar

	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
