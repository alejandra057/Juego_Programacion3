extends CharacterBody2D

const speed= 200
var current_dir = "none"
@export var maxHealth =4
@onready var current_health:int = 0
func _ready():
	$AnimatedSprite2D.play("front_idle")

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
			anim.play("right_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "left":
		anim.flip_h = false
		if movement ==1:
			anim.play("left_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "down":
		anim.flip_h = false 
		if movement ==1:
			anim.play("front_idle")
		elif  movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = false
		if movement ==1:
			anim.play("back_idle")
		elif  movement == 0:
			anim.play("front_idle")
		
#funcion para ver si ganó el juego
#if currentHealth <0
#currentHealth = max
