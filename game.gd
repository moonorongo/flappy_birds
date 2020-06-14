extends Node2D

var Wall = preload("wall.tscn")

var timer 
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var new_wall = Wall.instance()
	# new_wall.position.y = 150 # 500
	add_child(new_wall)

