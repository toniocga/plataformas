extends KinematicBody2D
#var re = int( cacau )

var gravedad = 100
var cacau 
var velocity:=Vector2()
onready var player = get_node("/root/Level_" + str(Global.nivel)+"/Player")

func _ready():
#	print(Vector2(floor(v.x), floor(v.y)))
	pass
func _physics_process(delta):
	
	velocity.y += gravedad * delta
	velocity  = move_and_slide(velocity)
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
#		print(body.name)
		velocity.x = player.velocity.x
#		print(body.get_global_position())
func _on_Area2D_body_exited(body):
	if body.name == "Player":
#		print(body.name)
		velocity.x = 0
