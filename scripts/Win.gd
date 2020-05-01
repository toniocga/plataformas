extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var nivel1 = load("res://scenes/Level1.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _on_Timer_timeout():
	print(get_parent().name)
	print(get_parent().get_parent().name)
	get_node("/root").add_child(nivel1)
	get_parent().get_parent().queue_free()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
