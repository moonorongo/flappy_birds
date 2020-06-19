extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -4)
	
	if(get_position().y < -24):
		position = Vector2(344, 0)
