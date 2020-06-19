extends Node2D

var Wall = preload("wall.tscn")

onready var timer = get_node("Timer")

func _ready():
	pass
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var new_wall = Wall.instance()
	add_child(new_wall)

