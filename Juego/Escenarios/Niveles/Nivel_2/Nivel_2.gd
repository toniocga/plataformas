extends Node2D
var celdas_dureza : Dictionary
func _ready():
	listas_resistencia_bloques()
#	print(listas_resistencia_bloques())
func _process(_delta):
	set_camera_limits()



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
		
		celdas_dureza[celda] = 3
	return celdas_dureza