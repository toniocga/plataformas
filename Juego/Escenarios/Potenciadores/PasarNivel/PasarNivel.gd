extends Node2D


#onready var pantalla_carga = preload("res://Menus/pantalla_carga/Carga.gd")


	
func _on_Area2D_body_entered(body):
	
	Global_cambiar_nivel.wait_frames = 50
	if body.get_name() == "Player":
		Global.nivel+=1
#		var instance_pantalla = pantalla_carga.new()
#		instance_pantalla.actualizar_niveles()
		if Global.nivel <= Global.numero_max_niveles:	
			
			Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_"+str(Global.nivel)+"/Nivel_"+str(Global.nivel)+".tscn")
		if Global.nivel > Global.numero_max_niveles:
			Global_cambiar_nivel.goto_scene("res://Menus/Creditos/Creditos.tscn")
#		if get_parent().filename == "res://Juego/Escenarios/Niveles/Nivel_1/Nivel_1.tscn":
#			Global_cambiar_nivel.goto_scene("res://Juego/Escenarios/Niveles/Nivel_2/Nivel_2.tscn")
#		Global.nivel+=1
#		if get_parent().filename == "res://Juego/Escenarios/Niveles/Nivel_2/Nivel_2.tscn":
#			Global_cambiar_nivel.wait_frames = 0
#			Global_cambiar_nivel.goto_scene("res://Menus/Creditos/Creditos.tscn")
#		print("pbody," , body.bandera_muerto)
#		body.bandera_muerto = true
#		add_child(win)
#		win.set_position(Vector2(-96,-50))
		
#	pass 
