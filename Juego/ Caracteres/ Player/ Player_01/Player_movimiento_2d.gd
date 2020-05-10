###############
extends KinematicBody2D
#
onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
export var snap := false
export var move_speed := 240
export var jump_force := 200
export var gravity := 300
export var slope_slide_threshold := 50.0
#var vidas_personaje = 3
var velocity := Vector2()
#var conesion_anima_fin

var left = -0.5
var right = 0.5
var direction_x = right
var agachado = false
##Cyclo Pi variables
var bandera_boton_pulsao = false
onready var gameover = load("res://Menus/GameOver/GameOver.tscn").instance()
var bandera_muerto = false
var bandera_sonido_pasos = true
#
#
func _physics_process(delta: float) -> void:
	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * move_speed
#	velocity.x = analog_velocity.x* move_speed
#	if is_on_wall() and 
	if Input.is_action_just_pressed("ui_up") and snap and not Input.is_action_pressed("ui_down")  or is_on_wall():
		salto()
#		velocity.y = -jump_force
		snap = false
#		audio_player.play()

	velocity.y += gravity * delta

	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)

	if is_on_floor() and (Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")):
		velocity.y = 0

	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
	
#	#	game over por límite inferior, esto hay que cambiarlo por game over por areas
	if position.y > 170:
		print(position.y)
		morir()	

#	salto y gravedad	
	if not is_on_floor():
		snap = false

	#		audio_player.play()
#	
	
	update_animation(velocity)
#func _physics_process(delta: float) -> void:
#
#	if bandera_muerto == false:
#
#
##	avance
##		velocity.x = direction_x * move_speed
#
#	#	game over por límite inferior, esto hay que cambiarlo por game over por areas
#		if position.y > 170:
##			print(position.y)
#			morir()	
#
#	#	salto y gravedad	
#		if not is_on_floor():
#			snap = false
#
#	#		audio_player.play()
#
#
#		velocity.y += gravity * delta
#
#		var snap_vector = Vector2(0,32) if snap else Vector2()
#		velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)
#
#		if Input.is_action_pressed("ui_right"):
#			velocity.x = direction_x * move_speed
#		else:
#			velocity.x = 0
#		if Input.is_action_pressed("ui_left") or bandera_boton_pulsao:
#			velocity.x = -direction_x * move_speed
#		else: 
#			velocity.x = 0
#		if Input.is_action_just_pressed("ui_up") and snap == true:
#			salto()
#		if Input.is_action_pressed("ui_down"):
#			agachado = true
#		else: 
#			agachado = false
#
#
#	#	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
#	#		velocity.y = 0
##		if is_on_wall():
##			if direction_x == left:
##				direction_x = right
##				if Input.is_action_pressed("ui_up") or bandera_boton_pulsao:
##					salto()
##
##			elif direction_x == right:
##				direction_x = left
##
##				if Input.is_action_pressed("ui_up") or bandera_boton_pulsao:
##					salto()
#
#		var acaba_aterizar := is_on_floor() and not snap
#		if acaba_aterizar:
#			snap = true
#			bandera_sonido_pasos = true
#
#		update_animation(velocity)
#
func update_animation(velocity: Vector2) -> void:
	var animation := "caminar"

	if abs(velocity.x) > 10.0:
#		
		sprite.flip_h = velocity.x < 0
		animation = "caminar"
		if bandera_sonido_pasos:
			bandera_sonido_pasos = false
			get_node("AudioPasos").play()
	if agachado == true:
		agacharse()


	if not is_on_floor():
		animation = "saltar" if velocity.y < 0 else "caer"

	if sprite.animation != animation:
		sprite.play(animation)

func salto():
	snap = false
	velocity.y = -jump_force
	get_node("AudioSalto").play()

func agacharse():
	sprite.play("saltar")
	print ("agachado")

func _on_TextureButton_pressed():
	bandera_boton_pulsao = false

func _on_TextureButton_button_down():
	bandera_boton_pulsao = true
	if snap :
		salto()





func _on_AudioPasos_finished():
	if snap :
		bandera_sonido_pasos = true
	pass # Replace with function body.

func morir():
	bandera_muerto = true
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
#		Global_cambiar_nivel.goto_scene("res://Menus/GameOver/GameOver.tscn")
		get_parent().add_child(gameover)
#		add_child(gameover)
#extends KinematicBody2D

#onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
##onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
##var analog_velocity = Vector2(0,0)
#export var snap := false
#export var move_speed := 250
#export var jump_force := 500
#export var gravity := 900
#export var slope_slide_threshold := 50.0
#var vidas_personaje = 3
#var velocity := Vector2()
##var conesion_anima_fin
#func _ready():
#	pass
#func _physics_process(delta: float) -> void:
#	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#	velocity.x = direction_x * move_speed
##	velocity.x = analog_velocity.x* move_speed
#	if Input.is_action_just_pressed("ui_up") and snap and not Input.is_action_pressed("ui_down"):
#		velocity.y = -jump_force
#		snap = false
##		audio_player.play()
#
#	velocity.y += gravity * delta
#
#	var snap_vector = Vector2(0,32) if snap else Vector2()
#	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)
#
#	if is_on_floor() and (Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")):
#		velocity.y = 0
#
#	var just_landed := is_on_floor() and not snap
#	if just_landed:
#		snap = true
#
##	
#
#	update_animation(velocity)

#func update_animation(velocity: Vector2) -> void:
##	var animation := "idle"
#
#	if abs(velocity.x) > 10.0:
##		var estaflip = $Sprite.is_flipped_h()
#		sprite.flip_h = velocity.x < 0
		
#		
#	animation = "run"

#	if not is_on_floor():
#		animation = "jump" if velocity.y < 0 else "fall"

#	if animation_player.current_animation != animation:
#		animation_player.play(animation)

