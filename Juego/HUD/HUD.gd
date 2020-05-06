extends CanvasLayer



#func puntos (puntos):
#	$puntuacion.set_text(puntos) 
func _process(delta):
#	get_node("puntuacion").set_text(str(Global.puntuacion))
	if Global.vidas == 2:
		get_node("vidas/vida3").set_visible(false)
		
	if Global.vidas == 1:
		get_node("vidas/vida3").set_visible(false)
		get_node("vidas/vida2").set_visible(false)
	if Global.vidas == 0:
		get_node("vidas/vida3").set_visible(false)
		get_node("vidas/vida2").set_visible(false)
		get_node("vidas/vida1").set_visible(false)
