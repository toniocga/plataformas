extends Node2D


#onready var win = load("res://Menus/Win/Win.tscn").instance()



func _on_Area2D_body_entered(body):
	Global_cambiar_nivel.wait_frames = 20
	if body.get_name() == "Player":
		if get_parent().filename == "res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn":
			Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_2/Nivel_2.tscn")
		if get_parent().filename == "res://Juego/Escenarios/Niveles/Nivel_2/Nivel_2.tscn":
			Global_cambiar_nivel.wait_frames = 0
			Global_cambiar_nivel.goto_scene("res://Menus/Creditos/Creditos.tscn")
#		print("pbody," , body.bandera_muerto)
#		body.bandera_muerto = true
#		add_child(win)
#		win.set_position(Vector2(-96,-50))
		
#	pass 
