extends Node2D
#var nodolabelpuntos = ()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		
		Global.puntuacion += 1
		self.queue_free()
#		print (Global.puntuacion)
		



