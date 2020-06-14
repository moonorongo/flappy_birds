extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# 429
	position += Vector2(-3, 0)
	
	if(get_position().x < -429):
		position = Vector2(0, 0)

