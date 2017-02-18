extends KinematicBody2D

const GRAVEDAD = 2000			#Valor que simula la gravedad para el eje y
const SALTO = -400				#Cantidad de pixeles que utilizamos como fuerza para el salto
const VELOCIDAD = 80			#Velocidad de desplazamiento lateral
var desplazamiento = Vector2()	#Cantidad de pixeles que se desplaza en cada eje
var mover = Vector2()			#Variable para calcular el vector de desplazamiento
var movimiento = Vector2()		#Variable que almacena el movimiento que queda por realizar
								#al resolverse una colisión
var saltando = false

var origen = Vector2()

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	origen = self.get_pos()
	
func _input(event):
	if event.is_action_pressed("ui_up"):
		if not saltando:
			desplazamiento.y = SALTO
		saltando = true
		get_node("AnimatedSprite").play("saltar")
	
	
func _fixed_process(delta):

	desplazamiento.y += GRAVEDAD * delta

	
	if Input.is_action_pressed("ui_left"):
		desplazamiento.x = -VELOCIDAD
		if not saltando:
			get_node("AnimatedSprite").play("caminar")
			get_node("AnimatedSprite").set_flip_h(true)
	elif Input.is_action_pressed("ui_right"):
		desplazamiento.x = VELOCIDAD
		if not saltando:
			get_node("AnimatedSprite").play("caminar")
			get_node("AnimatedSprite").set_flip_h(false)
	else:
		desplazamiento.x = 0
		get_node("AnimatedSprite").stop()
		get_node("AnimatedSprite").set_frame(0)
		
	mover = desplazamiento * delta
	mover = move(mover)
	
	# Para resolver la colision del KinematicBody 2D se utiliza el siguiente código
	if is_colliding():
		get_node("AnimatedSprite").set_animation("caminar")
		saltando = false
		var n = get_collision_normal()
		mover = n.slide(mover)
		desplazamiento = n.slide(desplazamiento)
		move(mover)
		
	if self.get_pos().x < 0:
		self.set_pos(Vector2(0,self.get_pos().y))
	if self.get_pos().x < 0:
		self.set_pos(Vector2(0,self.get_pos().y))
		
	if self.get_pos().y > get_viewport_rect().size.y:
		Global.vidas -= 1
		self.set_pos(origen)
		
	comprobar_posicion()
	
func comprobar_posicion():
	var pos_act = self.get_pos()
	
	self.set_pos(Vector2(clamp(pos_act.x,8,630),pos_act.y))
	
	