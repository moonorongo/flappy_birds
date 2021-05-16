extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0, -1)
	#1152
	if(get_position().y < -1152):
		position = Vector2(1366, 0)

