extends KinematicBody2D

var velocity 
var move_speed = 10
var direction = Vector2(0,0)
var obj
var celda_tiro 

onready var tilemap = get_node("/root/Level_" + str(Global.nivel) + "/TileMap")
onready var nivel = get_node("/root/Level_" + str(Global.nivel))

func _ready():
	
	$Timer.start()


func direccion_bala(d):
	if d:
		direction.x = -1
		obj = -1
	else:
		direction.x = 1
		obj = 1
	
func _physics_process(_delta: float) -> void:
	
	velocity = direction * move_speed
	velocity = move_and_collide(velocity)
	celda_tiro = tilemap.world_to_map(get_position())
	celda_tiro.x += obj
	if velocity:
		
		if nivel.celdas_dureza.has(celda_tiro):
			
			if nivel.celdas_dureza [celda_tiro] <= 1:

				tilemap.set_cell(celda_tiro.x,celda_tiro.y , -1)
			else:
				nivel.celdas_dureza[celda_tiro] -= 1
	
		queue_free()

func _on_Timer_timeout():
	queue_free()
