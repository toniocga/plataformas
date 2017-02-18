extends CanvasLayer


func _ready():
	set_process(true)
	
func _process(delta):
	get_node("puntuacion").set_text(Global.puntuacion)
