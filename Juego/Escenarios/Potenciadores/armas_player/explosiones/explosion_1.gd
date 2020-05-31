extends Node2D
onready var tilemap = get_node("/root/Level_" + str(Global.nivel) + "/TileMap")
#onready var animation : AnimationPlayer = $AnimationPlayer
onready var sonido_explosion : AudioStreamPlayer2D = $AudioStreamPlayer2D
var celda_tiro 


# Called when the node enters the scene tree for the first time.
func _ready():
	$CPUParticles2D.set_emitting(true) 
	celda_tiro = tilemap.world_to_map(get_position())
	
	tilemap.set_cell(celda_tiro.x,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y+1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y, -1)
	tilemap.set_cell(celda_tiro.x,celda_tiro.y-1, -1)
	tilemap.set_cell(celda_tiro.x-1,celda_tiro.y-1, -1)
	tilemap.set_cell(celda_tiro.x+1,celda_tiro.y-1, -1)
	
	sonido_explosion.play()
#	animation.play("explosion")
	sonido_explosion.connect("finished",self,"fin")
	
func fin():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_explosion_area_entered(area):
	if area.is_in_group("enemigo"):
		area.get_parent().queue_free()
