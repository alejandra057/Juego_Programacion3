extends Node2D
@onready var heartsContainer=$player/CanvasLayer/heartContainer

func _ready():
	heartsContainer.setMaxHearts(4)
	heartsContainer.updateHearts(1)

func _process(delta):
	if Input.is_action_just_pressed("space bar"):
		$Roulette.show()
		

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$Roulette.show()
