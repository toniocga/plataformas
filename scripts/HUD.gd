extends CanvasLayer


func _ready():
	set_process(true)
	
func _process(delta):
	get_node("puntuacion").set_text(str(Global.puntuacion))
	if Global.vidas == 2:
		get_node("vidas/vida1").set_hidden(true)
	if Global.vidas == 1:
		get_node("vidas/vida2").set_hidden(true)
	if Global.vidas == 0:
		get_node("vidas/vida3").set_hidden(true)