
##############
extends KinematicBody2D

onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
export var snap := false
export var move_speed := 200
export var jump_force := 200
export var gravity := 300
export var slope_slide_threshold := 50.0
#var vidas_personaje = 3
var velocity := Vector2()
#var conesion_anima_fin
onready var arma = get_node("arma_01")
onready var lanza_granadas = get_node("lanza_granadas")
#Cyclo Pi variables
#var bandera_boton_pulsao = false
#onready var gameover = load("res://Menus/GameOver/GameOver.tscn").instance()
var bandera_muerto = false
var bandera_sonido_pasos = true
var direction_x

func _physics_process(delta: float) -> void:
	
	velocity.y += gravity * delta
	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
	if position.y > 300:
#	
		morir()
	update_animation(velocity)

func movimiento():
	velocity.x = direction_x * move_speed

func disparo_1():
	arma.disparo()

func disparo_2():
	lanza_granadas.angulo_granada(get_node("AnimatedSprite").is_flipped_h())
	lanza_granadas.actualizar_direcion()
	lanza_granadas.lanzar_granada()

func _input(event):
	if Input.is_action_just_pressed("espacio") and snap and not Input.is_action_pressed("ui_down"):
		salto()
#	Parar la caida
	if is_on_floor() and (Input.is_action_just_released("derecha") or Input.is_action_just_released("izquierda")):
		velocity.y = 0
		


#	Mover izquierda derecha
	if Input.is_action_pressed("derecha") or Input.is_action_pressed("izquierda"):
		direction_x = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda")
		movimiento()
#	Parar movimiento
	if Input.is_action_pressed("derecha") == false and Input.is_action_pressed("izquierda") == false:
		velocity.x = 0
	

	if is_on_wall() and Input.is_action_pressed("espacio"):
		salto()

#	
	if Input.is_action_pressed("click_izquierdo"):
		disparo_1()

	if Input.is_action_just_pressed("click_derecho"):
		disparo_2()


	update_animation(velocity)

	#	game over por límite inferior, esto hay que cambiarlo por game over por areas

#var mover_caja
#func mover_caja():
#	mover_caja = direction_x
func update_animation(velocity: Vector2) -> void:
	var animation := "caminar"

	if abs(velocity.x) > 10.0:
#		
		sprite.flip_h = velocity.x < 0
		animation = "caminar"

		bandera_sonido_pasos = false




	if not is_on_floor():
		animation = "saltar" if velocity.y < 0 else "caer"

	if sprite.animation != animation:
		sprite.play(animation)




func salto():
	snap = false
	velocity.y = -jump_force
	get_node("AudioSalto").play()


func _on_AudioPasos_finished():
	if snap :
		bandera_sonido_pasos = true
#	pass # Replace with function body.

func morir():
	bandera_muerto = true
	Global.puntuacion = 0
	Global.monedas = 0

	quitar_vida()
#	print("game over por límite inferior, esto hay que cambiarlo por game over por areas")

#	gameover.set_position(get_position())
#	Global_cambiar_nivel.goto_scene("res://Menus/GameOver/GameOver.tscn")
	pass

func quitar_vida():
	if Global.vidas > 1:
		Global.vidas -= 1
#		Global_cambiar_nivel.wait_frames = 20
		Global_cambiar_nivel.goto_scene(get_parent().filename)
	elif Global.vidas <= 1 :
		Global.vidas -= 1
#		Global_cambiar_nivel.wait_frames = 0
		Global_cambiar_nivel.goto_scene("res://Menus/GameOver/GameOver.tscn")
#		get_parent().add_child(gameover)
#		add_child(gameover)



################################################3
