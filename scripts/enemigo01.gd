extends KinematicBody2D

var left = -5
var right = 5
var direction_x = right
var gravedad = 300
var velocity := Vector2()
export var move_speed := 5


func _physics_process(delta): 

	velocity.y += gravedad * delta
	velocity.x = direction_x * move_speed
	velocity = move_and_slide_with_snap(velocity,Vector2(0,0), Vector2.UP)
	if is_on_wall():
			if direction_x == left:
				direction_x = right
			elif direction_x == right:
				direction_x = left
	
	