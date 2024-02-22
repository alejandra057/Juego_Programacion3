extends CharacterBody2D

var temporizador
const speed= 250
var current_dir = "none"
var animacion
var ronda1=true
var ronda2=false
var ronda3=false
var ronda4=false
var ronda5=false
var cntarentrada=0;
var posicioninicial
var vida1
var vida2
var vida3
var vida4
var vida5
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var contar=0
func _ready():
	animacion=$AnimatedSprite2D
	temporizador = $"../Timer"
	$AnimatedSprite2D.play("frente")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)
	vida1=$TextureRect4
	vida2=$TextureRect3
	vida3=$TextureRect2
	vida4=$TextureRect5
	vida5=$TextureRect6
	vida5.hide()
	vida4.hide()
	vida3.hide()
	vida2.hide()
	vida1.hide()
	
func _physics_process(delta):
	player_movement(delta)
	

func player_movement (delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir= "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir= "left"
		play_anim(1)
		velocity.x =-speed
		velocity.y = 0
	elif  Input.is_action_pressed("ui_down"):
		current_dir= "down"
		play_anim(1)
		velocity.y= speed
		velocity.x= 0
	elif  Input.is_action_pressed("ui_up"):
		current_dir= "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func play_anim(movement):
	var dir= current_dir
	var anim = $AnimatedSprite2D

	if dir == "right":
		anim.flip_h = false 
		if movement ==1:
			anim.play("derecha")
		elif  movement == 0:
			anim.play("derecha")
			anim.stop()
	if dir == "left":
		anim.flip_h = false
		if movement ==1:
			anim.play("izquierda")
		elif  movement == 0:
			anim.play("izquierda")
			anim.stop()
	if dir == "down":
		anim.flip_h = false 
		if movement ==1:
			anim.play("frente")
		elif  movement == 0:
			anim.play("frente")
			anim.stop()
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("espalda")
		elif  movement == 0:
			anim.play("espalda")
			anim.stop()
		

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Escenas/inicioworld.tscn")
	pass # Replace with function body.


func _on_area_b_body_entered(body):
	contar+=1;
	if $Node2D.valor!=1:
		Saveus.contarpalabra+=1
		$Node2D._process(body)
		#if $Node2D.valor==0:
		vida1.show()
		$mensaje.show()
		temporizador.wait_time = 1.5
		temporizador.start()
		print("valorrr ",$Node2D.valor)
		if $Node2D.valor==3:
			vida3.show()
			vida2.hide()
			vida1.hide()
			temporizador.wait_time = 1.5
			temporizador.start()
			$mensaje.text="Respuesta Correcta"
			temporizador.wait_time = 1.5
			temporizador.start()
		if $Node2D.valor==4:
			vida4.show()
			vida3.hide()
			temporizador.wait_time = 1.5
			temporizador.start()
			$mensaje.text="Respuesta Correcta"
			temporizador.wait_time = 1.5
			temporizador.start()
		if $Node2D.valor==5:
			vida5.show()
			vida4.hide()
			$mensaje.text="Felicidades!"
			$mensaje/Button.show()
			temporizador.stop()
	else:
			print("un else")
			temporizador.wait_time = 1.5
			temporizador.start()
	Saveus.contarpalabra=0
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	contar+=1;
	$Node2D._process(body)
	Saveus.contarpalabra=0
	#$"../Sprite2D".show()
	temporizador.wait_time = 1.5
	temporizador.start()
	pass # Replace with function body.


func _on_area_a_body_entered(body):
	contar+=1;
	print("Entra en perry")
	$Node2D._process(body)
	Saveus.contarpalabra=0
	#$"../Sprite2D2".show()
	temporizador.wait_time = 1.5
	temporizador.start()
	pass # Replace with function body.


func _on_area_c_body_entered(body):
	print("entroxddd")
	if $Node2D.valor==1:
		Saveus.contarpalabra+=1
		$Node2D._process(body)
		vida2.show()
		$mensaje.show()
		$mensaje.text="Respuesta Correcta"
		temporizador.wait_time = 1.5
		temporizador.start()
	else:
		print("Respuesta incorrecta")
		#$"../Sprite2D3".show()
		temporizador.wait_time = 1.5
		temporizador.start()
	
	Saveus.contarpalabra=0
	pass # Replace with function body.



func _on_pregunticas_body_entered(body):
	print("toca")
	$Node2D.show()
	pass # Replace with function body.



func _on_pregunticas_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.





func _on_timer_timeout():
	$".".position=Saveus.posicioninicial
	temporizador.stop()
	$mensaje.hide()
	if $Node2D.valor==4:
		$Node2D.valor+=1
	pass # Replace with function body.
