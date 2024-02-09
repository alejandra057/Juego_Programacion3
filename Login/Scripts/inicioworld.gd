extends Node2D
@onready var heartsContainer=$player/CanvasLayer/heartContainer
@onready var puertas = $DoorsAnimation
func _process(delta):
	if Input.is_action_just_pressed("space bar"): 
		$Node2D.show()
		



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$Node2D.show()


		
