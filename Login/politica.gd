extends Node2D

var ruleta= ""
var escena= ""
func _process(delta):
	if Input.is_action_just_pressed("p"):
		get_tree().change_scene_to_file(ruleta)
		
func _input(event):
	if Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file(ruleta)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		ruleta ="res://Escenas/EscenaPrincipal.tscn"

func _on_area_2d_2_body_exited(body):
	if body.is_in_group("player"):
		escena ="res://Escenas/zootopia.tscn"
