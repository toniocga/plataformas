extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var nivel0 = load("res://scenes/Level0.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TextureButton_button_down():
	Global.nivel = 0
	get_node("/root").add_child(nivel0)
	queue_free()
	
	pass # Replace with function body.
