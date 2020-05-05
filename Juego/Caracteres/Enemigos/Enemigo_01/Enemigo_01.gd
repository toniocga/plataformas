extends KinematicBody2D
#onready var nodoPlayer = get_tree().get_root().get_node(get_parent().name +"/Player")
var left = -5
var right = 5
var direction_x = right
var gravedad = 300
var velocity := Vector2()
export var move_speed := 5
# radio del area del enemigo para saber cuando lo mata
onready var alturaEnemigo = $Area2Denemigo/CollisionShape2D.get_shape().radius

func _physics_process(delta): 
#	print(alturaEnemigo2)
	velocity.y += gravedad * delta
	velocity.x = direction_x * move_speed
	velocity = move_and_slide_with_snap(velocity,Vector2(0,0), Vector2.UP)
	if is_on_wall():
		if direction_x == left:
			direction_x = right
			get_node("AnimatedSprite").set_flip_h(false) 
		elif direction_x == right:
			direction_x = left
			get_node("AnimatedSprite").set_flip_h(true) 
	
	elif not $RayCast2D_izquierda.is_colliding() or not $RayCast2D_derecha.is_colliding():
		if not $RayCast2D_izquierda.is_colliding():
			direction_x = right
			get_node("AnimatedSprite").set_flip_h(false) 
		if not $RayCast2D_derecha.is_colliding():
			get_node("AnimatedSprite").set_flip_h(true) 
			direction_x = left
	else:
		pass
func _on_Area2Denemigo_body_entered(body):

	if body.name == "Player":
		if body.get_position().y + alturaEnemigo < get_position().y:
			body.salto()
			print("piso")
			queue_free()
		else:
			body.morir()
		