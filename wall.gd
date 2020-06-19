extends StaticBody2D

var velocity = Vector2.ZERO
var original_position
export (int) var speed = -4

var rng = RandomNumberGenerator.new()


func _ready():
	rng.randomize()
	
	original_position = Vector2(rng.randi_range(700, 1110), 840)
	position = original_position
	set_process(true)

func _process(delta):
	position += Vector2(0, speed)
	
	if(get_position().y < -90):
		queue_free()
		#position = original_position


