extends StaticBody2D

var velocity = Vector2.ZERO
var original_position
export (int) var speed = -3

var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	
	original_position = Vector2(910, rng.randi_range(150, 500))
	position = original_position
	set_process(true)

func _process(delta):
	position += Vector2(speed, 0)
	
	if(get_position().x < -90):
		queue_free()
		#position = original_position


