extends Node2D
var ruta=""
var rutac=""
var rutap=""
var rutah=""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("a"):
		get_tree().change_scene_to_file(ruta)
	elif Input.is_action_just_pressed("h"):
		get_tree().change_scene_to_file(rutah)
	elif Input.is_action_just_pressed("c"):
		get_tree().change_scene_to_file(rutac)
	elif Input.is_action_just_pressed("p"):
		get_tree().change_scene_to_file(rutap)
	pass


func _on_area_2d_2_body_entered(body):
	print("entra")
	if body.is_in_group("player") and Saveus.selectrosa:
		print("Entra en a")
		ruta="res://Escenas/arte.tscn"
	if body.is_in_group("player")and Saveus.selecmorado:
		rutah="res://Escenas/historia.tscn"
	if body.is_in_group("player") and Saveus.selectnara:
		rutac="res://Escenas/ciencia.tscn"
	if body.is_in_group("player") and Saveus.selectazul:
		rutap="res://Escenas/politica.tscn"
	pass # Replace with function body.
