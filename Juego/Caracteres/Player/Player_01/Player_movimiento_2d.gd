extends KinematicBody2D

onready var sprite : Sprite = $Sprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
#var analog_velocity = Vector2(0,0)
export var snap := false
export var move_speed := 250
export var jump_force := 500
export var gravity := 900
export var slope_slide_threshold := 50.0
var vidas_personaje = 3
var velocity := Vector2()
#var conesion_anima_fin
var nodoprincipal
func _ready():
	nodoprincipal = get_tree().get_root().get_node("Principal")
func _physics_process(delta: float) -> void:
	var direction_x := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = direction_x * move_speed
#	velocity.x = analog_velocity.x* move_speed
	if Input.is_action_just_pressed("jump") and snap and not Input.is_action_pressed("abajo"):
		velocity.y = -jump_force
		snap = false
#		audio_player.play()

	velocity.y += gravity * delta

	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)

	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
		velocity.y = 0

	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
	if Input.is_action_pressed("abajo") and Input.is_action_just_pressed("jump"):
#	print(analog_velocity.y)
#	if analog_velocity.y < 0 and Input.is_action_just_pressed("jump"):
#		and Input.is_action_just_pressed("jump")
		activar_desactivar_colision()
	
	update_animation(velocity)

func update_animation(velocity: Vector2) -> void:
#	var animation := "idle"
	
	if abs(velocity.x) > 10.0:
#		var estaflip = $Sprite.is_flipped_h()
		sprite.flip_h = velocity.x < 0
		$aspiradora.animacion_aspiradora(sprite.is_flipped_h())
#		
#	animation = "run"

#	if not is_on_floor():
#		animation = "jump" if velocity.y < 0 else "fall"

#	if animation_player.current_animation != animation:
#		animation_player.play(animation)

func activar_desactivar_colision():
	set_collision_mask_bit(0,false)
	$Tiempo_activar_collision.start()

func _on_Tiempo_activar_collision_timeout():
	set_collision_mask_bit(0,true)
	
func _on_AreaDano_area_entered(area)-> void:
	var nodoPrincipal = get_tree().get_root().get_node("Principal")
	var nodoAnimacion = get_tree().get_root().get_node("Principal/Control/LabelGameOver/AnimationPlayer2")
	
	if area.is_in_group("enemigo"):
		if vidas_personaje <=0:
			#poner animacion de morir y game over
			
			nodoAnimacion.play("animacion_gameover")
			if nodoAnimacion.is_connected( "animation_finished", self, "game_over")==false:
				nodoAnimacion.connect("animation_finished", self, "game_over")
				
				print("muere")
		else:
			vidas_personaje -= 1
#			$AreaDano/CollisionShape2D.call_deferred("set_disabled(true)")
			
			# meter la animacion de morirse y ponerlo en el punto salida
			# parpadeo inmunidad
			nodoPrincipal.personaje_salida($".")
#			$AnimationPlayer.play("parpadeo")
			
#			if $AnimationPlayer.is_connected( "animation_finished", self, "inmune")==false:
				
				
#				conesion_anima_fin = $AnimationPlayer.connect("animation_finished",self,"inmune")
			print("no muere",vidas_personaje)	

func inmune(parpadeo):
	parpadeo = $AreaDano/CollisionShape2D.set_disabled(false) 
	
#func analog_force_change(inForce, inStick):
#	if(inStick.get_name()=="AnalogRight"):
#
#		if (inForce.length() < 0.1):
#			analog_velocity = Vector2(0,0) 
#
#		else:
#			analog_velocity = Vector2(inForce.x,inForce.y)
##
##
#		analog_velocity = analog_velocity.normalized()
##
#		analog_velocity.x = stepify(analog_velocity.x, 1)
#		analog_velocity.y = stepify(analog_velocity.y, 1)


var vargameover
func game_over(animacion_gameover):
	
	vargameover = global.goto_scene("res://juego/menus/menu_principal.tscn")