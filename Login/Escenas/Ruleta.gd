extends Node2D
var velocidad = 0
var encendido = false
var contar = 0
var opciones = [{"nombre": "Politica", "probabilidad": 0.2}, {"nombre": "Ciencia", "probabilidad": 0.3}, {"nombre": "Arte", "probabilidad": 0.4}, {"nombre": "Historia", "probabilidad": 0.1}]
var lbpolitica : Label
var lbciencia : Label
var lbarte: Label
var lbhistoria : Label
var texto : Label
var btok : Button
var selecmorado = false
var selectnara = false
var selectazul = false
var selectrosa = false
var tiempoextra = 0
var timer : Timer
var rotacion : Node2D
var estado
var seleccion_actual = null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomize()
	
	lbpolitica = $lbpolitica
	lbciencia = $lbciencia
	lbarte = $lbarte
	lbhistoria = $lbhistoria
	texto = $"../lbanuncio"
	timer = $"../Timer"
	rotacion = $"."
	lbpolitica.hide()
	lbciencia.hide()
	lbarte.hide()
	lbhistoria.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if encendido:
		rotacion.rotation_degrees += velocidad * delta
		if velocidad > 0:
			velocidad -= 20 * delta
		else:
			encendido = false
			mostrar_opcion()
	if Input.is_action_just_pressed("space bar"):
		girar_ruleta()

#func _process(delta):
	#if velocidad <= 0:
		#encendido = false
		#timer.stop()
		#eliminar()
		#if tiempoextra > 0:
			#timer.set_wait_time(tiempoextra)
			#timer.start()
			#tiempoextra = 0
	#if encendido:
		#rotacion.rotation_degrees += velocidad * delta
	#else:
		#encendido = false
	#if Input.is_action_just_pressed("space bar"):
		#contar = 1
		#velocidad = randf_range(30, 40)
		#encendido = true
		#timer.set_wait_time(1.5)
		#timer.start()

func girar_ruleta():
	if not encendido:
		encendido = true
		velocidad = randf_range(200, 220)
		seleccion_actual = seleccionar_opcion()
		timer.set_wait_time(2)
		timer.start()

func seleccionar_opcion():
	var opciones_validas = []
	for opcion in opciones:
		if opcion != seleccion_actual:
			opciones_validas.append(opcion)
	var total_probabilidad = 0
	for opcion in opciones_validas:
		total_probabilidad += opcion["probabilidad"]
	var random_value = randf() * total_probabilidad
	var suma_probabilidad = 0
	for opcion in opciones_validas:
		suma_probabilidad += opcion["probabilidad"]
		if random_value < suma_probabilidad:
			return opcion
	return opciones_validas[-1]

func mostrar_opcion():
	match seleccion_actual["nombre"]:
		"Politica":
			lbpolitica.show()
			texto.text = "CATEGORIA\nPOLITICA"
			 var inicio_world = get_node(inicio_world/castillo)
			if inicio_world:
				var animation_player = inicio_world.get_node("doorsanimation")
				 if animation_player:
					animation_player.play("nombre_de_la_animacion_politica")
		
		"Ciencia":
			lbciencia.show()
			texto.text = "CATEGORIA\nCIENCIA"
			selectnara = true
		"Arte":
			lbarte.show()
			texto.text = "CATEGORIA\nARTE"
			selectrosa = true
		"Historia":
			lbhistoria.show()
			texto.text = "CATEGORIA\nHISTORIA"
			selecmorado = true
