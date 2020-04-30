
##############
extends KinematicBody2D

onready var sprite : AnimatedSprite = $AnimatedSprite
#onready var animation_player : AnimationPlayer = $AnimationPlayer
#onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer2D
export var snap := false
export var move_speed := 100
export var jump_force := 160
export var gravity := 300
export var slope_slide_threshold := 50.0
#var vidas_personaje = 3
var velocity := Vector2()
#var conesion_anima_fin

var left = -0.5
var right = 0.5
var direction_x = right
var bandera_boton_pulsao = false

func _physics_process(delta: float) -> void:
#	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	velocity.x = direction_x * move_speed
	if not is_on_floor():
		snap = false
	if Input.is_action_just_pressed("ui_up") and snap:
		salto()
#		audio_player.play()
	
	
	velocity.y += gravity * delta

	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)

#	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
#		velocity.y = 0
	if is_on_wall():
		if direction_x == left:
			direction_x = right
			if Input.is_action_pressed("ui_up") or bandera_boton_pulsao:
				salto()
				
		elif direction_x == right:
			direction_x = left

			if Input.is_action_pressed("ui_up") or bandera_boton_pulsao:
				salto()
				
	var acaba_aterizar := is_on_floor() and not snap
	if acaba_aterizar:
		snap = true
	
	update_animation(velocity)

func update_animation(velocity: Vector2) -> void:
	var animation := "idle"
	
	if abs(velocity.x) > 10.0:
#		
		sprite.flip_h = velocity.x < 0
		animation = "caminar"

	if not is_on_floor():
		animation = "saltar" if velocity.y < 0 else "caer"
		
	if sprite.animation != animation:
		sprite.play(animation)


func _on_TextureButton_pressed():
	bandera_boton_pulsao = false

	pass # Replace with function body.
	
func salto():
	snap = false
	velocity.y = -jump_force

func _on_TextureButton_button_down():
	bandera_boton_pulsao = true
	if snap :
		salto()
	pass # Replace with function body.
