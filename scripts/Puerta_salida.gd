extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var win = load("res://scenes/Win.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player" and Global.nivel ==0 :
		print("pbody," , body.bandera_muerto)
		body.bandera_muerto = true
		add_child(win)
		win.set_position(Vector2(-96,-50))
		
	if body.get_name() == "Player" and Global.nivel ==1 :
		print("pbody," , body.bandera_muerto)
		body.bandera_muerto = true
		add_child(win)
		win.set_position(Vector2(-96,-50))
		
	pass # Replace with function body.
