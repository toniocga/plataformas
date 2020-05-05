extends Node2D
onready var nombredelapantalla = get_parent().name
onready var nodolabelpuntos = get_node("/root/"+nombredelapantalla+"/HUD/puntuacion")
# var a = 2
# var b = "textvar"

func _ready():
#	nodolabelpuntos = get_node(“/root/Level0”)
	# Initialization here
	pass


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		Global.puntuacion += 1
		nodolabelpuntos.set_text(str(Global.puntuacion)) 
		hide()
		$AudioStreamPlayer2D.play()

func _on_AudioStreamPlayer2D_finished():
	self.queue_free()
