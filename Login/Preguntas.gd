extends Node2D

var texts : Array = [
	" Entre los siguientes renacentistas seleccione, uno de los precursores filósofo-científico del heliocentrismo 
	  (teoría que afirma que el sol es el centro del universo)
	  A) Tomas Moro. B) Galileo. C) Platón. D) Arquimedes ",
	"El método científico se introduce por el interés de tres filósofos. Entre los siguientes
	 uno de los mencionados no es precursor del método científico: A) Francis Bacon. B) Galileo Galilei. C)Nicolas Maquiavelo. D) René Descartes"
]
var current_text: int=0
var contar=0
@onready var visual_text :RichTextLabel =$panel/RichTextLabel
@onready var animation_mark: AnimationPlayer=$panel/AnimationPlayer
@onready var mark : Control=$panel/Control
@onready var animation_text: AnimationPlayer =$panel/AnimationPlayer
var mostrar=false
var electC=false
var electA=false
var electB=false
var electD=false
# Called when the node enters the scene tree for the first time.	
func _ready():
	visual_text.visible_ratio=0
	visual_text.text=texts[current_text]
	mark.visible=0
	show_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("contar en process ",Saveus.contarpalabra)
	if Saveus.contarpalabra>0:
		next_text()
		set_process(false)
		

func next_text():
	if current_text < texts.size()-1:
		current_text +=1
		visual_text.visible_ratio=0
		visual_text.text=texts[current_text]
		mark.visible=0
		show_text()

func show_text():
	var tween = create_tween()
	tween.tween_property(visual_text,"visible_ratio",1,1.5)
	tween.tween_callback(finish_showtext)

func finish_showtext():
	mark.visible = 1
	animation_mark.play("MasTexto")
	set_process(true)


func _on_areac_body_entered(body):
	pass
	if current_text==0:
		print("Respuesta incorrecta")
	#print("aqui esta")
	#electC=true
	#electA=false
	#electB=false
	#electD=false
	##next_text()
	#if electC:
		#Saveus.contarpalabra=1
		#print("contar en area ",contar)
		#_process(body)
		#$"../CharacterBody2D".position=Saveus.posicioninicial
	#set_process(true)
	#next_text()


func _on_area_a_body_entered(body):
	#electA=true
	#electC=false
	#electB=false
	#electD=false
	#if electA:
		#Saveus.contarpalabra=1
		#print("contar en area ",Saveus.contarpalabra)
		#_process(body)
	pass # Replace with function body.


func _on_area_d_body_entered(body):
	#electA=false
	#electC=false
	#electB=false
	#electD=true
	#if electD:
		#Saveus.contarpalabra=1
		#print("contar en area ",Saveus.contarpalabra)
		#_process(body)
	pass # Replace with function body.


func _on_areab_body_entered(body):
	if current_text==0:
		print("Respuesta correcta")
		
		
	#electA=false
	#electC=false
	#electB=true
	#electD=false
	#if electB:
		#Saveus.contarpalabra=1
		#print("contar en area ",Saveus.contarpalabra)
		#_process(body)
	pass # Replace with function body.
