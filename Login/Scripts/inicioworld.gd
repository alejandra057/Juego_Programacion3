extends Node2D
@onready var heartsContainer=$player/CanvasLayer/heartContainer
var ruta1= ""
var ruta2= ""
var ruta3= ""
var ruta4 =""
func _ready():
	heartsContainer.setMaxHearts(4)
	heartsContainer.updateHearts(1)
	
	
func _input(event):
	if Input.is_action_just_pressed("h"):
		get_tree().change_scene_to_file(ruta1)
	if Input.is_action_just_pressed("p"):
		get_tree().change_scene_to_file(ruta2)
	if Input.is_action_just_pressed("c"):
		get_tree().change_scene_to_file(ruta3)
	if Input.is_action_just_pressed("a"):
		get_tree().change_scene_to_file(ruta4)
		
func _process(delta):
	if Input.is_action_just_pressed("space bar"): 
		$Roulette.show()
		
		
func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
			ruta1 ="res://historia.tscn"


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("player"):
			ruta2 ="res://Escena_poli.tscn"

func _on_area_2d_4_body_entered(body):
	if body.is_in_group("player"):
			ruta3 ="res://Escenas/dr__and_perry_world.tscn"


func _on_area_2d_5_body_entered(body):
	if body.is_in_group("player"):
			ruta4 ="res://Escenas/Rapunzel_world.tscn"
