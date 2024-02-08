extends CharacterBody2D


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
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var contar=0
func _ready():
	animacion=$AnimatedSprite2D
	$spriteironman.play("espalda")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)
	vida1=$"1vida"
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
	var anim = $spriteironman

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
			anim.play("Frente")
		elif  movement == 0:
			anim.play("Frente")
			anim.stop()
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("espalda")
		elif  movement == 0:
			anim.play("espalda")
			anim.stop()
		



func _on_area_2d_body_entered(body):
	print("entroxddd")
	Saveus.contarpalabra+=1
	$Node2D._process(body)
	$".".position=Saveus.posicioninicial
	print("posicionxd ",posicioninicial)
	if $Node2D.current_text==0:
		print("Respuesta incorrecta")
	pass # Replace with function body.


func _on_area_a_body_entered(body):
	contar+=1;
	print("Entra en perry")
	Saveus.contarpalabra+=1
	$Node2D._process(body)
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	contar+=1;
	Saveus.contarpalabra+=1
	$Node2D._process(body)
	pass # Replace with function body.


func _on_areab_body_entered(body):
	contar+=1;
	Saveus.contarpalabra+=1
	$Node2D._process(body)
	if $Node2D.current_text==0:
		$TextureRect.hide()
		vida1.show()
		print("Respuesta correcta")
	pass # Replace with function body.


func _on_señal_body_entered(body):
	print("entraaa")
	contar+=1
	if contar>1:
		$"../Texto".show()
	pass # Replace with function body.


func _on_señal_body_exited(body):
	$"../Texto".hide()
	pass # Replace with function body.


func _on_preguntas_body_entered(body):
	print("toca")
	$Node2D.show()
	pass # Replace with function body.


func _on_preguntas_body_exited(body):
	$Node2D.hide()
	pass # Replace with function body.
