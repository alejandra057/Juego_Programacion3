extends Node2D
func _process(delta):
	if Input.is_action_just_pressed("space bar"):
		$Roulette.show()
		

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$Roulette.show()
