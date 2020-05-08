extends Node2D

func _process(delta):
	get_node("Creditos").text = leer()
	
func leer():
	var file = File.new()
	if not file.file_exists("res://Menus/Creditos/Texto/Licencias.txt"):
		return "No se puede acceder \al archivo de Licencias"
	file.open("res://Menus/Creditos/Texto/Licencias.txt",file.READ)
	var data = file.get_as_text()
	file.close()
	return data
	

func _on_Timer_timeout():
#	no entra
#	print(get_parent().name)
#	get_node("/root").add_child(inicio)
#	queue_free()
	Global_cambiar_nivel.wait_frames = 0
	Global_cambiar_nivel.goto_scene("res://Menus/MenuPrincipal/MenuPrincipal.tscn")

