extends KinematicBody2D

#var vidas_personaje = 3
var velocity 
var move_speed = 10
var direction = Vector2(0,0)
var obj
onready var tilemap = get_node("/root/Level_" + str(Global.nivel) + "/TileMap")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
#	print(tilemap)

func direccion_bala(d):
	if d:
		direction.x = -1
		obj = -1
	else:
		direction.x = 1
		obj = 1
var celda_tiro 
func _physics_process(_delta: float) -> void:

	velocity = direction * move_speed
	velocity = move_and_collide(velocity)
	celda_tiro = tilemap.world_to_map(get_position())
	if velocity:
#		print(get_position())
		
		tilemap.set_cell(celda_tiro.x + obj  ,celda_tiro.y ,-1)
		queue_free()
func _on_Timer_timeout():
	queue_free()
