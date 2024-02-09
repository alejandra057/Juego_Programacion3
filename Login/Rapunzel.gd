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
	#temporizador = $"../Timer"
	$AnimatedSprite2D.play("izquierda")
	Saveus.posicioninicial=$".".position
	print("posicion ",posicioninicial)
	
	
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
		


func _on_area_b_body_entered(body):
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	pass # Replace with function body.


func _on_area_a_body_entered(body):
	pass # Replace with function body.


func _on_area_c_body_entered(body):
	pass # Replace with function body.
