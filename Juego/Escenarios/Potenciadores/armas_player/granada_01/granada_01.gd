extends KinematicBody2D

var _gravedad = 0
var _movimiento


var collide

onready var g_explosion = preload("res://Juego/Escenarios/Potenciadores/armas_player/explosiones/explosion_1.tscn")
var rebote = 0.4



func _ready():
	$Timer.start()
	pass

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
	var g_explota = g_explosion.instance()
	g_explota.set_global_position(get_global_position())
	hide()
	get_parent().add_child(g_explota)
	queue_free()



