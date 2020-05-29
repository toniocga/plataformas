extends Node2D
onready var sonido_disparo : AudioStreamPlayer2D

var Bullet = preload("res://Juego/Escenarios/Potenciadores/armas_player/balas/bala_01/bala_01.tscn")


func _ready():
	sonido_disparo = $AudioStreamPlayer2D

	
	
func disparo():
	var player_dir = get_parent().get_node("AnimatedSprite").is_flipped_h()
	var b = Bullet.instance()
	b.set_global_position(get_global_position())
	get_owner().get_parent().add_child(b)
	b.direccion_bala(player_dir)
	sonido_disparo.play()
	pass
