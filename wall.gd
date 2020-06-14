extends StaticBody2D

var velocity = Vector2.ZERO
var original_position


func _ready():
	original_position = position
	set_process(true)

func _process(delta):
	position += Vector2(-3, 0)
	
	if(get_position().x < -90):
		position = original_position


