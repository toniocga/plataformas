extends Node2D
var celdas_dureza : Dictionary

func _ready():
	listas_resistencia_bloques()
#	print($TileMap.get_cell(1,1))
#	areas_de_las_celdas()
func _process(_delta):
	set_camera_limits()

func destruir_bloques(arg):
	$TileMap.set_cell( arg.x ,arg.y , -1 ) 
	

func set_camera_limits():
    var map_limits = $TileMap.get_used_rect()
    var map_cellsize = $TileMap.cell_size
    $Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
    $Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
    $Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
    $Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y


func listas_resistencia_bloques():
	var celdas_ocupadas =$TileMap.get_used_cells()

	for celda in celdas_ocupadas:
		if $TileMap.get_cell(celda.x,celda.y) == 17:
			celdas_dureza[celda] = 10
		else:
			celdas_dureza[celda] = 1
	return celdas_dureza

#func areas_de_las_celdas():
#	var celdas_ocupadas =$TileMap.get_used_cells()
#
#	for celda in celdas_ocupadas:
##		var area = Area2D.new()
#		var area = load("res://recursos/TileSet/AreaDestruible.tscn").instance()
#		area.set_name(str(celda))
#		area.set_global_position(celda*32)
#		var collision = CollisionShape2D.new()
#		collision.name = str(celda)
#
#		area.add_child(collision)
#		var shape = RectangleShape2D.new()
#		shape.extents = Vector2(10,10)
#		collision.shape = shape
#		celda = Vector2(celda.x,celda.y)
		
#		add_child(area)
#		area.add_to_group("destruible")