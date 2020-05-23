extends Node2D

# Declare member variables here. Examples:
var Bullet = preload("res://Juego/Escenarios/Potenciadores/armas_player/balas/bala_01/bala_01.tscn")
# var b = "text"

func _ready():
	
	pass # Replace with function body.
	
	
func disparo():
	var player_dir = get_parent().get_node("AnimatedSprite").is_flipped_h()
	var b = Bullet.instance()
	b.set_global_position(get_parent().get_global_position())
	get_owner().get_parent().add_child(b)
	b.direccion_bala(player_dir)
	pass
