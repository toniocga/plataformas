extends KinematicBody2D
#var velocity 
#var move_speed = 4
#var direction = Vector2(0,-2)
var _gravedad = 0
var _movimiento
#var obj
var celda_tiro 
var collide
onready var tilemap = get_node("/root/Level_" + str(Global.nivel) + "/TileMap")
#export var gravedad := 10
#onready var nivel = get_node("/root/Level_" + str(Global.nivel))
var rebote = 0.4
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass
#func direccion_granada(d):
#	if d:
#		direction.x = -1
#
#	else:
#		direction.x = 1
func lanzar_granada(direcion_fuerza,gravedad_granada):
	_movimiento = direcion_fuerza
	_gravedad = gravedad_granada
	
func _physics_process(delta: float) -> void:
	
	_movimiento.y += delta * _gravedad
	if collide:
#		var entidad = collide.get_collider()
		var normal = collide.get_normal() 
		# aplicar botes
		_movimiento = (_movimiento - 2 * _movimiento.dot(normal) * normal) * rebote
	collide = move_and_collide(_movimiento)


func _on_Timer_timeout():
	
	$AreaImpaco/CollisionShape2D.set_disabled(false) 

	
	celda_tiro = tilemap.world_to_map(get_position())
	
	tilemap.set_cell(celda_tiro.x,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y, -1)
	tilemap.set_cell(celda_tiro.x,celda_tiro.y-1, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y-1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y-1, -1)
	
	


func _on_AreaImpaco_area_entered(area):
#	var list_enemigos : Array
#	var ray := RayCast2D
	$Timer2.start()
	if area.is_in_group("enemigo"):
		area.get_parent().queue_free()

func _on_Timer2_timeout():
	queue_free()


#		list_enemigos.append(area.get_global_position())
#		print(list_enemigos)
#		print(area.get_global_position())
#		var n = 0
#		for d in list_enemigos:
#			n +=1
#			print("rayo" + str(n) +"  ",d)
#			var r = ray.new()
#			add_child(r)
#			r.set_global_position(get_global_position())
			
#			r.set_cast_to(d)
#			print (r)


