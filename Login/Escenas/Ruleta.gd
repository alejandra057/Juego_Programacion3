extends Node2D


var velocidad=20
var encendido=false
var contar=0
var estado
var opciones=[]
var lbpolitica : Label
var lbciencia : Label
var lbarte: Label
var lbhistoria : Label
var texto : Label
var btok : Button
var selecmorado=false
var selectnara=false
var selectazul=false
var selectrosa=false
var tiempoextra=0
var intentos =2
@onready var timer=$"../Timer"
@onready var rotacion=$"."

# Called when the node enters the scene tree for the first time.
func _ready():
	encendido=false
	print("opciones: ",opciones)
	lbpolitica=$lbpolitica
	lbciencia=$lbciencia
	lbarte=$lbarte
	lbhistoria=$lbhistoria
	btok=$"../Button2"
	texto =$"../lbanuncio"
	#lbarte.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if velocidad<=0:
		encendido=false
		timer.stop()
		eliminar()
	
	if encendido==true and intentos>0:
		rotacion.rotation_degrees+=velocidad
	else:
		encendido=false
	pass


func _on_timer_timeout():
	velocidad-=5



func _on_btiniciar_pressed():
	contar=1
	intentos-=1;
	velocidad=randf_range(15,25)
	encendido=true
	#randomize()
	timer.start()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Color"):
		estado="Naranja"
		print(estado)
		if selectnara==true:
			tiempoextra+3
			print("pasa")
	pass # Replace with function body.


func _on_area_2d_2_area_entered(area):
	if area.is_in_group("Color"):
		estado="Rosa"
		print(estado)
	
	pass # Replace with function body.


func _on_area_2d_3_area_entered(area):
	if area.is_in_group("Color"):
		estado="Azul"
		print(estado)
		if selectazul==true:
			print("pasa")
	pass # Replace with function body.


func _on_area_2d_4_area_entered(area):
	if area.is_in_group("Color"):
		estado="Morado"
		print(estado)
		if selecmorado==true:
			print("pasa")
	pass # Replace with function body.

func eliminar():
			if "Morado"==estado:
				lbhistoria.show()
				texto.text="CATEGORIA\nHISTORIA"
				btok.show()
				selecmorado=true
				Saveus.selecmorado=true
				Saveus.contarmorado=+1
				print("morado",Saveus.contarmorado)
				if Saveus.contarmorado>1:
					Saveus.selecmorado=false
					lbhistoria.show()
					intentos+=1
			elif "Azul"==estado:
				lbpolitica.show()
				btok.show()
				texto.text="CATEGORIA\nPOLITICA"
				selectazul=true
				Saveus.selectazul=true
				Saveus.contarazul=+1
				print("AZul",Saveus.contarazul)
				if Saveus.contarazul>1:
					Saveus.selectazul=false
					lbpolitica.show()
					intentos+=1
			elif "Naranja"==estado:
				lbciencia.show()
				texto.text="CATEGORIA\nCIENCIA"
				btok.show()
				selectnara=true
				Saveus.selectnara=true
				Saveus.contarnara+1
				print("naranja",Saveus.contarnara)
				if Saveus.contarnara>1:
					Saveus.selectnara=false
					lbciencia.show()
					intentos+=1
			elif "Rosa"==estado:
				lbarte.show()
				btok.show()
				texto.text="CATEGORIA\nARTE"
				selectrosa=true
				Saveus.selectrosa=true
				Saveus.contarrosa=+1
				print("rosa",Saveus.contarrosa)
				if Saveus.contarrosa>1:
					Saveus.selectrosa=false
					lbarte.show()
					intentos+=1


func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and Input.is_action_just_pressed("a"):
		get_tree().change_scene_to_file("res://Escenas/arte.tscn")
	elif body.is_in_group("player") and Input.is_action_just_pressed("h"):
		get_tree().change_scene_to_file("res://Escenas/historia.tscn")
	if body.is_in_group("player") and Input.is_action_just_pressed("c"):
		get_tree().change_scene_to_file("res://Escenas/ciencia.tscn")
	elif body.is_in_group("player") and Input.is_action_just_pressed("p"):
		get_tree().change_scene_to_file("res://Escenas/politica.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://ejemplo.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://ejemplo.tscn")
	pass 
