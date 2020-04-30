extends Node2D
onready var nodolabelpuntos = get_node("/root/Level/HUD/puntuacion")
# class member variables go here, for example:
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
		print(nodolabelpuntos.name)
		self.queue_free()
#		print (Global.puntuacion)
		



