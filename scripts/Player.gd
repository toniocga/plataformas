
##############
extends KinematicBody2D

#onready var sprite : Sprite = $Sprite
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
var nodoprincipal
var jumping = false
func _physics_process(delta: float) -> void:
	
	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * move_speed
	if not is_on_floor():
		snap = false
	
	if Input.is_action_just_pressed("ui_up") and snap:
		
		snap = false
		velocity.y = -jump_force
#		audio_player.play()
	
	
	velocity.y += gravity * delta

	var snap_vector = Vector2(0,32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity,snap_vector, Vector2.UP, slope_slide_threshold)

#	if is_on_floor() and (Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left")):
#		velocity.y = 0
	
	var acaba_aterizar := is_on_floor() and not snap
	if acaba_aterizar:
		snap = true
	
	
