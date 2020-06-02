extends CanvasLayer



#func puntos (puntos):
#	$puntuacion.set_text(puntos) 
func _process(_delta):
	#get_node("Score/puntuacion").set_text(str(Global.puntuacion))
	if Global.vidas == 2:
		get_node("vidas/vida3").set_visible(false)
		
	elif Global.vidas == 1:
		get_node("vidas/vida3").set_visible(false)
		get_node("vidas/vida2").set_visible(false)
	elif Global.vidas == 0:
		get_node("vidas/vida3").set_visible(false)
		get_node("vidas/vida2").set_visible(false)
		get_node("vidas/vida1").set_visible(false)
	
	if Global.touch == true:
		get_node("touch").set_visible(true)
	if Global.touch == false:
		get_node("touch").set_visible(false)
