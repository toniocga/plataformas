extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var nivel1 = load("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TextureButton_button_down():
	Global.nivel = 0
#	get_node("/root").add_child(nivel1)
#	queue_free()
	Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn")
	pass # Replace with function body.
